import pickle
nb=pickle.load(open('workbench/N16-g2-dimension/nullbasis.pkl','rb'))
mats=nb['mats']
print('num mats',len(mats),'shape', len(mats[0]), 'x', len(mats[0][0]))
print('mat0 type elt', type(mats[0][0][0]))
for r in mats[0]:
    print(r)
