# Image-Annotation-of-Human-Sports-Actions
The project is designed with an aim to annotate human action related to sports. The UCF Sports Dataset is used in this context. Apart from traditional automatic and semi-automatic methods I have designed a framework based on frames extraction, interest point’s generation, and clustering for annotation of human sport actions.

Methodology for Image Annotation

The Figure 1 below represents the methodology developed to annotate actions in an image. Mainly there are three stages, interest point generation, clustering and classification. For interest point detection I have used the famous SIFT descriptor. For clustering, to achieve reliable result I have used the four popular clustering methods K-mean, K-medoid, Fuzzy c mean and agglomerative clustering. Lastly, a classifier is trained with annotated images.

![modified diagram](https://user-images.githubusercontent.com/14160468/198852711-bd362b6d-f3ff-4c8f-9f58-16c06f054dd6.jpg)
1.	SIFT interest points.

The below figure represent the detection of interest points.

![intrest points](https://user-images.githubusercontent.com/14160468/198853072-ea23e5b6-0320-447d-a4f0-969c4e11481f.jpg)

2.  Clustering

I have used four popular clustering methods described as follow:

   i) K-mean
   
K-mean clustering is the most popular clustering method used in machine learning. The aim of the technique is to partition observation into k clusters. The formula is described below:

                                                             d(x,c)=(x-c)(x-c)'
                                                             
ii) K-medoid

The K-medoids clustering work similar to K-means clustering but in contrast with K-means the K-medoids selects feature vector as a center and uses Manhattan Norm to find the distance between the feature vector and center instead of l_2 norm. The formula is described below:


                                                    |(|x_  |)|= ∑_(i=1)^n▒〖||x_(i ) ||〗  

iii) Fuzzy-C mean 

Fuzzy-C mean is a data clustering technique that is used to group the data set into k clusters in such a way that every feature vector in dataset belongs to every cluster to a certain degree. The degree of belonging or membership of feature vector towards a certain cluster depends upon its closeness with the center of the cluster.

iv) Agglomoreative Clustering

The agglomerative clustering is based on the bottom-up approach. Each feature vector starts in its own cluster and a pair of the cluster having the minimum distance are merged in one thus moves own to form the hierarchy. The formula is described below:

                                                               min{d(x,y):x ε A ,y ε B}
                                                               
3. Classification

The annotated labels are trained on a SVM classifier for classification of actions.
 

Evaluation model

The evaluation model for the proposed model is performed in two steps. The first step deals with the evaluation of generated clusters. Subsequently, the second step is performed to evaluate the generated labels.

1.	Evaluation of generated clusters

Clustering is unsupervised learning method so it is not reliable to use performance measure of the supervised learning method such as precision and recall to evaluate it. The best way to evaluate a generated cluster is to measure inter and intracluster distance of the clusters and the best way to do is through silhouette analysis. The mathematical representation is as follow:  

                                     S(i)=b(i)-(i)/max( b(i),a(i))
                                     
a(i) indicates the mean distance of a point w.r.t to all other point in the assigned cluster (A).

b(i) indicates the mean distance of a point w.r.t to all other point in the assigned cluster(B)

The below figure represent the silhouette analysis of clustering method in use.
 
![HHACOMBINE](https://user-images.githubusercontent.com/14160468/198853686-922ac2cf-6278-4a52-b145-a72f9d9eef80.jpg)

2. Evaluation of generated labels

In order to evaluate the performance of generated labels for unsupervised data, the best way is to measure the similarity between the generated labels and some ground truth. Certain similarity measures such as Adjusted Rand index is best suitable for our scenario. For this methodology we achieve a set of features vectors represented as F={0_(1…………………………) 0_n } and 2 clusters of F are drawn one is considered as assign labels represented as A and other is generated label through proposed methodology represented as G. So, we have A={A_(1…………………………) A_n } and G={G_(1…………………………) G_n }. We can define the following condition 

	a= number of pairs of elements in F that are same in A and G
    
	b= number of pairs of elements in F that are different in A and G
    
	c= number of pairs of elements in F that are same in A and different in G
    
	d= number of pairs of elements in F that are different in A and but same in G
    
So, rand index can simply be calculated as

                                          R=(a+b)/(a+b+c+d) = (a+b)/2!

a+b represent an agreement between A and G

c+d represent disagreement between A and G.




