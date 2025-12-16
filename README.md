# Google Trends Looker Block

This Looker Block provides a comprehensive analysis of Google Trends data using the Google BigQuery Public Dataset. It allows users to visualize Top Terms (popularity) and Top Rising Terms (growth velocity) globally, unifying US-specific data (DMAs) with International data (Regions/Countries) into a seamless experience.

## 📥 Installation & Configuration

1. Connection Setup
Ensure you have a BigQuery connection configured in Looker that has access to the bigquery-public-data project.

2. Configuration
When installing this Block, Looker allows you to override these constants through the installation menu.

* CONNECTION_NAME (Required): You must set this value to the name of a valid BigQuery connection in your Looker instance. This connection must have permission to query public datasets.

* TRENDS_DATASET & TRENDS_PUBLIC_PROJECT_ID (Optional): These should be left as default. They are pre-configured to point to the official Google Trends public data.

## 🏗️ Project Structure & Architecture
The project follows a Raw vs. Refined architectural pattern to ensure code reusability, maintainability, and a unified global view.

#### Folder Structure

* dashboards/: Contains the pre-built dashboards for analysis.

* explores/: The user-facing Explores (global_top_terms, global_top_rising_terms).

* models/: The model file configuration.

* views/:

    * raw/: Contains the direct 1:1 mappings of the BigQuery tables (separated by US and International).

    * refined/: Contains the complex logic, unions, and the core "Base" view.

### The "Extends" Pattern (base_trends.view)
We utilize a centralized parent view called base_trends.view. Why? To adhere to the DRY (Don't Repeat Yourself) principle.

### Global Unification (Union Logic)
Google Trends splits data into two tables: one for the US (Designated Market Areas - DMAs) and one for International (Country/Region).

global_top_terms & global_top_rising_terms: These views perform a SQL UNION ALL to combine both sources.

### Smart Geography:
We use Liquid logic to dynamically display "DMA" for US records and "Region Name" for international records, appearing as a single Region field to the end-user.

## 📊 Key Metrics & Logic

### 1 - Popularity vs. Growth

 * Score (Index 0-100): Represents Popularity. A score of 100 indicates the term's peak popularity relative to its own 5-year history in that specific region.

 * % Growth (Percent Gain): Represents Velocity. How fast a term is growing compared to the previous period.

### 2 - Rising Tiers (Growth Classification)

To help identify "viral" trends quickly, we categorize terms based on their % Growth:

 * Breakout: > 5,000% growth. (Viral/Explosive)

 * Soaring: 1,000% - 5,000% growth.

 * Rising: 250% - 1,000% growth.

 * Spiking: < 250% growth.

### 3 - Date Logic (Snapshot vs. History)

 * Refresh Date: The "newspaper date." The day the term made the list. Use this to filter for "What is trending today?".

 * Week: The historical timeline. Used to plot the 5-year trend of a term found in the Refresh Date snapshot.

## 📈 Dashboards

### 1 - Overview Global
Goal: A high-level executive summary of what is happening in the world right now.

 * Key Visuals:

   * Top Terms Bar Chart (ranked by Avg Score).

   * Word Cloud for visual sentiment/topic clustering.

   * KPI Tiles for quick term identification.

   * Filters: Latest Refresh Week, Country, Region.

### 1.1 - Trending Terms Section
Goal: Focus specifically on velocity and discovering new opportunities (Rising Terms).

 * Key Visuals:

   * Rising Term Distribution (Donut): Quickly see the ratio of "Breakout" vs. "Soaring" terms to gauge market volatility.

   * Trend Velocity Table: A detailed look at rank, score, and exact % growth.

   * Use Case: Ideal for SEO content creation and spotting viral news.

### 2 - Term Analysis Global
Goal: Deep-dive investigation into specific keywords.

 * Key Visuals:

   * Term Over Time (Line Chart): Historical 5-year performance of the selected term.

   * Regional Comparison: Compares the selected term's performance across different regions against a benchmark.

   * Similar Terms: Contextualizes the search query.

## 🚀 How to Use

1. Explore Data: Go to the Global Top Terms or Global Top Rising Terms explore.

2. Filter by Date: Always ensure you are filtering by Refresh Date (or Is Latest Week = Yes) to see the most current trends.

3. Filter by Location: Use Country Name to narrow down the scope. The Region Name will automatically adjust to show States/DMAs (if US) or Provinces/Regions (if International).

4. Analyze: Drill into Term to see specific dashboards.

## 🌍 Data Source & Background
This Looker Block is built on top of the official Google Trends Public Dataset hosted in Google BigQuery. It allows users to query anonymized, aggregated, and indexed search interest data directly using SQL, bypassing the manual limitations of the standard Google Trends UI.

### What is this data?
The dataset provides a daily feed of search trends, split into two primary categories:

* Top 25 Terms: The queries with the highest search volume (Popularity).

* Top 25 Rising Terms: The queries with the highest velocity of growth compared to a previous period (Trending).

### How is it structured?
The data is not raw search counts; it is an index (0-100) representing search interest relative to the highest point on the chart for the given region and time.

* Global & Local Scope:

   * US Data: Granular data broken down by 210 Designated Market Areas (DMAs).

   * International Data: Global coverage broken down by Country and sub-regions.

* Rolling History: Each daily update provides a snapshot of the top terms for that day, accompanied by a rolling 5-year window of historical data. This allows for immediate context (is this term just trending today, or has it been popular for years?).

* Privacy: All data is anonymized, aggregated, and indexed to protect user privacy while providing meaningful signals for analysis.

* References:

   * [Google Cloud Blog: Top 25 Google Search Terms now in BigQuery](https://cloud.google.com/blog/products/data-analytics/top-25-google-search-terms-now-in-bigquery)

   * [Google Cloud Blog: International Google Trends Datasets in BigQuery](https://cloud.google.com/blog/products/data-analytics/international-google-trends-datasets-in-bigquery)
