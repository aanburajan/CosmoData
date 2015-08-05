To start off, I apologize for not being able to record the metadata that was mined by the ipython code,

Youtube MetaDataGet — Dataset

Uses the pafy library to pull some youtube data
	Takes each videos’ title, description, tags

Combines the title, description, tags of each video into a single slot per datapoint, takes out the stop words and then uses the gensim  library to do some LSA analysis.

I was not able to get past applying the functions provided by gensim  

There is also some usage of the word cloud package though i did not get that far into that.





Get Youtube Category — Dataset

mines youtube for the categories of each youtube video
	Categorized various categories based on the 24 hour time window

	- future analysis could differentiate weekends and weekday clicks to see if there is a different 

I then used the word cloud package to create images of the most used words int titles of the music related youtube videos
	I made a small stop list dictionary that took out some of the most frequent words like “ft”, official, video, audio as these words are implied by the music category






Social Media Usage - Dataset

Clickstream analysis was created and done here.

I defined clickstreams as a metric for measurement.

TIME_MAX_DIFF is a variable i devised to define the maximum amount of time between consecutive clicks in a clickstream. Increasing this time will create longer clickstreams (decreasing the total number as well) and decreasing this amount will amount to more clickstreams, although generally shorter.

I looked at various ways to draw conclusions out of this dataset.

one thing I was interested in was the presence of social media within clickstreams.

For longer clickstreams, I hypothesized that there were long instances of clicks that would lead to the user thinking about checking her social media and as a result click on a social media event. 
	Please see ash for those conclusions.


I collected data as to how often social media was clicked, like how long there was before the first SM click, how how often between SM clicks etc.

GL.