import pandas as pd 
import numpy as np
import h5py
from scipy import stats
from scipy import interp
from sklearn.metrics import roc_auc_score
from sklearn.metrics import roc_curve
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from matplotlib import colors
from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LogisticRegression 
from sklearn.model_selection import KFold

# 1.1 Data Loading and Transformation
filename="simulations.h5"
with h5py.File(filename,"r") as f:
    keys=f.keys()
    arr_df=[] # array storing all dataframes from h5 file (data,subject1,subject2...subject99)
    for i in list(range(len(keys))):
        e=pd.read_hdf(filename,keys[i])
        arr_df.append(e)
# 1.
data_df=arr_df[0] # dataframe containing 'data' data
subject_df=arr_df[1:] # list of dataframes containing subject data
# 2.
arr=[] # array of datasets organized by simulation where index refers to simulation number
merged_df=subject_df[0].reset_index(drop=False)
merged_df=pd.concat(subject_df,axis=0).reset_index(drop=False).groupby('index')
subjects=[]
for i in range(len(data_df)):
    subjects.append('subject_'+str(i))
for j in range(len(data_df)):
    sim_num='sim_'+str(j)
    m=merged_df.get_group(sim_num)
    m['Subject']=subjects
    finish=m.reset_index().drop(['level_0','index'],axis=1)
    arr.append(finish.set_index('Subject'))

# 1.2 Analysis
avg=data_df['a'].mean()
print('The mean of [a] for the data is '+str(avg))
std=data_df['a'].std()
print('The standard error of [a] for the data is '+str(std))
p_corr=data_df[['b','c']].corr(method='pearson')
print('The Pearson correlation coefficient between [b,c] is '+str(p_corr.loc['c','b']))

mean_a=[]
p_corr_bc=[]
p_val=[]
for i in list(range(100)):
    n=100
    r=arr[i][['b','c']].corr(method='pearson').loc['c','b']
    m=arr[i]['a'].mean()
    mean_a.append(m)
    p_corr_bc.append(r)
    t=m/np.sqrt(r/n)
    p_val.append(stats.t.sf(np.abs(t),n-1)*2)
print('The empirical p-value of these statistics: ',p_val)

# 1.3 Modeling
def k5fold():
    auc=[]
    for s in arr:
        data_df['label']=[0]*len(data_df)
        s['label']=[1]*len(s)
        df=data_df.append(s).sample(frac=1).reset_index(drop=True)
        kf=KFold(n_splits=5)
        kf.get_n_splits(df)
        X_train,X_test,Y_train,Y_test=train_test_split(df[['a','b','c']].to_numpy(),df['label'].to_numpy(),test_size=0.33,random_state=42)
        model=LogisticRegression()
        model.fit(X_train,Y_train)
        training_accuracy=model.score(X_train,Y_train) 
        roc=roc_auc_score(Y_train,model.predict(X_train))

        X=df[['a','b','c']].to_numpy()
        Y=df['label'].to_numpy()
        tprs=[]
        base_fpr=np.linspace(0, 1, 101)
        for i,(train,test) in enumerate(kf.split(df)):
            model.fit(X[train],Y[train])
            score=model.predict_proba(X[test])
            fpr,tpr,_=roc_curve(Y[test],score[:,1])
            tpr=interp(base_fpr,fpr,tpr)
            tpr[0]=0.0
            tprs.append(tpr)
        tprs=np.array(tprs)
        mean_tprs=tprs.mean()
        std_tprs=tprs.std()
        auc.append(mean_tprs)
    print('The mean ROC-AUC across the 5 folds is '+str(mean_tprs))
    # Plot mean AUC across all simulations (normalized and unnormalized)    
    plt.figure()
    N,bins,patches=plt.hist(np.array(auc),bins=np.linspace(0.25,0.75,50),density=True)
    fracs=N/N.max()
    norm=colors.Normalize(fracs.min(),fracs.max())
    # Color code plot by density
    for thisfrac,thispatch in zip(fracs,patches):
        color=plt.cm.viridis(norm(thisfrac))
        thispatch.set_facecolor(color)
    plt.ylabel('Number of Simulations')
    plt.xlabel('Mean AUC Value')
    plt.title('Histogram of Mean AUC Across Simulations')
    plt.savefig('histogram.png')

    print('The mean AUC of this distribution is '+str(np.array(auc).mean()))
    print('The standard deviation of this distribution is '+str(np.array(auc).std()))
k5fold()


