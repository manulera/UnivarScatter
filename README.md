#Univarscatter

Draw an **univariate scatter plot** out of a nx2 table with a
categorical/string and a numerical variable, or out of a
numerical array, with groups/categories corresponding
to the columns of the numerical array. The function returns the `(x,y)` coordinates of the dots, so you can use them for custom plotting.

This kind of graph is very popular in biochemistry/biology
papers.

<img src="example1.svg" width="400"/><img src="example2.svg" width="400"/>

## Basic usage
```matlab

% Generate 3 normal COLUMN VECTORS of different lengths
smallset=normrnd(0,3,[10,1]);
averageset=normrnd(0,3,[50,1]);
bigset=normrnd(0,3,[150,1]);

%Concatenate them, and fill the empty ones with nans, keep in mind that you
%can do this much faster with the function padcat (see extra functions)

DataArray=nan(size(bigset,1),3);
DataArray(1:length(smallset),1)=smallset;
DataArray(1:length(averageset),2)=averageset;
DataArray(1:length(bigset),3)=bigset;

figure
UnivarScatter(DataArray,'Label',{'Small','Average','Big'});
```

## Customizing the graph

Many custom options are available as `Name,Value`
pairs.
For optimal visualization of your data I
recommend to play with `RangeCut`, and also with `pbaspect` of the plot, it
really changes the appearance.

## Extra functions
You need the following functions for this function to work:

* `CatTable2Array` included here.

Also, a very simple function to assign colors is
provided, `ColorCoder`, you can see several examples in the
script `UnivarScatterExamples.m`.

A useful function to create the input of the function from columns of different lengths is the function `padcat` ([link](https://fr.mathworks.com/matlabcentral/fileexchange/22909-padcat))

All your feedback is welcome to improve this function

## Similar functions
In Mathworks I came across a function that does something very similar to this, `plotSpread`([link](http://www.mathworks.com/matlabcentral/fileexchange/37105-plot-spread-points--beeswarm-plot-))