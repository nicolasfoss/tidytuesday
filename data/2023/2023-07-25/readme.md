### Please add alt text to your posts

Please add alt text (alternative text) to all of your posted graphics
for `#TidyTuesday`.

Twitter provides
[guidelines](https://help.twitter.com/en/using-twitter/picture-descriptions)
for how to add alt text to your images.

The DataViz Society/Nightingale by way of Amy Cesal has an
[article](https://medium.com/nightingale/writing-alt-text-for-data-visualization-2a218ef43f81)
on writing *good* alt text for plots/graphs.

> Here's a simple formula for writing alt text for data visualization:
> \### Chart type It's helpful for people with partial sight to know
> what chart type it is and gives context for understanding the rest of
> the visual. Example: Line graph \### Type of data What data is
> included in the chart? The x and y axis labels may help you figure
> this out. Example: number of bananas sold per day in the last year
> \### Reason for including the chart Think about why you're including
> this visual. What does it show that's meaningful. There should be a
> point to every visual and you should tell people what to look for.
> Example: the winter months have more banana sales \### Link to data or
> source Don't include this in your alt text, but it should be included
> somewhere in the surrounding text. People should be able to click on a
> link to view the source data or dig further into the visual. This
> provides transparency about your source and lets people explore the
> data. Example: Data from the USDA

Penn State has an
[article](https://accessibility.psu.edu/images/charts/) on writing alt
text descriptions for charts and tables.

> Charts, graphs and maps use visuals to convey complex images to users.
> But since they are images, these media provide serious accessibility
> issues to colorblind users and users of screen readers. See the
> [examples on this page](https://accessibility.psu.edu/images/charts/)
> for details on how to make charts more accessible.

The `{rtweet}` package includes the [ability to post
tweets](https://docs.ropensci.org/rtweet/reference/post_tweet.html) with
alt text programatically.

Need a **reminder**? There are
[extensions](https://chrome.google.com/webstore/detail/twitter-required-alt-text/fpjlpckbikddocimpfcgaldjghimjiik/related)
that force you to remember to add Alt Text to Tweets with media.

# Scurvy 

The data this week comes from the [medicaldata R package](https://higgi13425.github.io/medicaldata/). This is a data package from Peter Higgins, with 19 medical datasets for teaching Reproducible Medical Research with R.

We're using the [scurvy dataset](https://htmlpreview.github.io/?https://github.com/higgi13425/medicaldata/blob/master/man/description_docs/scurvy_desc.html). 

> Source: This data set is from a study published in 1757 in A Treatise on the Scurvy in Three Parts, by James Lind.

> This data set contains 12 participants with scurvy. In 1757, it was not known that scurvy is a manifestation of vitamin C deficiency. A variety of remedies had been anecdotally reported, but Lind was the first to test different regimens of acidic substances (including citrus fruits) against each other in a randomized, controlled trial. 6 distinct therapies were tested in 12 seamen with symptomatic scurvy, who were selected for similar severity. Six days of therapy were provided, and endpoints were reported in the text at the end of 6 days. These include rotting of the gums, skin sores, weakness of the knees, and lassitude, which are described in terms of severity. These have been translated into Likert scales from 0(none) to 3(severe). A dichotomous endpoint, fitness for duty, was also reported.

> Scurvy was a common affliction of seamen on long voyages, leading to mouth sores, skin lesions, weakness of the knees, and lassitude. Scurvy could be fatal on long voyages. James Lind reported the treatment of 12 seamen with scurvy in 1757, in _A Treatise on the Scurvy in Three Parts). This 476 page bloviation can be found scanned to the Google Books website A Treatise on the Scurvy. Pages 149-153 are a rare gem among what can be generously described as 400+ pages of evidence-free blathering, and these 4 pages may represent the first report of a controlled clinical trial.

> Lind was the ship’s surgeon on board the HMS Salisbury, and had a number of scurvy-affected seamen at his disposal. Many remedies had been described and advocated for, with no more than anecdotal evidence. On May 20, 1747, Lind decided to try the 6 therapies on the Salisbury in a comparative study in 12 affected seamen. He selected 12 with roughly similar severity, with notable skin and mouth sores, weakness of the knees, and significant lassitude, making them unfit for duty. They each received the standard shipboard diet of gruel and mutton broth, supplemented with occasional biscuits and puddings. Each treatment was a dietary supplement (including citrus fruits) or a medicinal.

> This data frame was reconstructed from Lind’s account as recorded on these 4 pages, with his estimates of severity translated to a 4 point Likert scale (0-3) for each of the symptoms he described at his chosen endpoint on day 6. A somewhat fanciful study_id variable was added, along with detailed descriptions of the dosing schedule of each treatment. Of note, there is some dispute about whether this was truly the first clinical trial, or whether it actually happened, as there are no contemporaneous corroborating accounts. See link about the historical debate.

> Lind reported that the seamen treated with 2 lemons and an orange daily did best, followed by those treated with cider. Those treated with elixir of vitriol only had improvement in mouth sores. One imagines that acidic substances (like dilute sulfuric acid, vinegar, cider, and citrus fruits) might have been rather painful on these mouth sores. Unfortunately, the burial of the 4 valuable pages of data in 476 pages of noise, a publication delay of 10 years, and Lind’s half-hearted conclusions (he was focused on acidity), meant that it took until 1795 before the British Navy mandated daily limes for seamen.



### Get the data here

```{r}
# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load('2023-07-25')
tuesdata <- tidytuesdayR::tt_load(2023, week = 30)

scurvy <- tuesdata$scurvy

# Or read in the data manually

scurvy <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-07-25/scurvy.csv')

```

### Data Dictionary

# `scurvy.csv`

|variable                  |class     |description               |
|:-------------------------|:---------|:-------------------------|
|study_id                  |double    |Participant ID                 |
|treatment                 |character |Treatment; cider, dilute_sulfuric_acid, vinegar, sea_water, citrus, purgative_mixture                |
|dosing_regimen_for_scurvy |character |Dosing Regimen; 1 quart per day; 25 drops of elixir of vitriol, three times a day; two spoonfuls, three times daily; half pint daily; two lemons and an orange daily; a nutmeg-sized paste of garlic, mustard seed, horseradish, balsam of Peru, and gum myrrh three times a day |
|gum_rot_d6                |character |Gum Rot on Day 6; 0_none, 1_mild, 2_moderate, 3_severe             |
|skin_sores_d6             |character |Skin Sores on Day 6; 0_none, 1_mild, 2_moderate, 3_severe            |
|weakness_of_the_knees_d6  |character |Weakness of the Knees on Day 6; 0_none, 1_mild, 2_moderate, 3_severe  |
|lassitude_d6              |character |Lassitude on Day 6; 0_none, 1_mild, 2_moderate, 3_severe            |
|fit_for_duty_d6           |character |Fit for Duty on Day 6; 0_no, 1_yes          |


### Cleaning Script

The first column was removed from the scurvy.csv file available at https://github.com/higgi13425/medicaldata/tree/master/data-raw.