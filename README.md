# Reviews

## Keboola Blocks Intro (Scaffold Prerequisite)
Looker Blocks powered by Keboola are designed to work in tandem with corresponding Keboola Scaffolds in the Keboola Connection platform. Similar to Blocks in nature, Keboola Scaffolds are templatized use-cases that can be instantly deployed into the Keboola platform, providing the whole data management and processing chain required to populate the Looker dashboards.

## Block Overview
This Block connects to data from Keboola “Reviews - Looker” Scaffold into Looker. Its purpose is to provide a quick out-of-the-box end to end integration and functionality to be used either stand-alone or to be combined with other data, into scorecards, etc. In order to set up the Keboola data feed, please contact us: [here](https://get.keboola.com/lookerblocks?block=rt_hospitality). If you don’t have a ReviewTrackers account, you can set up a free trial [here](https://www.reviewtrackers.com/request-demo/?utm_source=keboola&utm_medium=affiliate&utm_campaign=trial_link).

## Data and Block Structure
The block contains two LookML dashboards:
*  Ratings Overview for understanding the relative ratings, sentiment value, responsiveness and to highlight negative reviews for handling
*  NLP Analysis for deeper dive into the topics and their relative contribution to positive and negative feedback

The underlying model is simple and there is just one explore - “reviews”.

As a standard, the data gets provided as a connection to Keboola-provided Snowflake, but it can be easily changed to your own data warehouse of choice during the setup.
