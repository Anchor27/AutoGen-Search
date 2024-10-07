This repository details my internship experience at the **Defence Scientific Information & Documentation Centre (DESIDOC)**, a laboratory under the **Defence Research and Development Organization (DRDO)**, from January 2024 to March 2024. During my internship, I developed **AutoGen Search** for the DRDO eLibrary, an AI-powered search engine. The software features an Autocomplete function to assist users in crafting better search queries and an AI-driven Search Summary feature, providing concise summaries of various books and journals available in the eLibrary.

_To view to-the-point summary, please follow here: https://sites.google.com/view/aryan-joshi/tech-blogs/drdo_

# AutoGen-Search
<img src="https://github.com/Anchor27/Projects-Data-Repo/blob/main/AUTOGEN%20LOGO%20LARGE.png" alt="AutoGen Search Logo">

## Table of Contents
- [1. Introduction](#1-introduction)
  - [1.1 About DESIDOC, DRDO](#11-about-desidoc-drdo)
  - [1.2 Problem Statement](#12-problem-statement)
  - [1.3 The Solution](#13-the-solution)
- [2. AutoGen Search](#2-autogen-search)
  - [2.1 Working Demo](#21-working-demo)
  - [2.2 System Components and Working Overview](#22-system-components-and-working-overview)
  - [2.3 Components](#23-components)
    - [2.3.1 Frontend](#231-frontend)
    - [2.3.2 Backend](#232-backend)
    - [2.3.3 Elasticsearch](#233-elasticsearch)
    - [2.3.4 Large Language Model (LLM)](#234-large-language-model-llm)
- [3. Setup](#3-setup)
  - [3.1 Prerequisites](#31-prerequisites)
  - [3.2 Installation](#32-installation)
    - [3.2.1 Using `git clone`](#321-using-git-clone)
    - [3.2.2 Using zip file](#322-using-zip-file)
  - [3.3 Setup Elasticsearch Index and OpenAI API Key](#33-setup-elasticsearch-index-and-openai-api-key)
  - [3.4 Running AutoGen Search](#34-running-autogen-search)



# 1. Introduction
## 1.1 About DESIDOC, DRDO
The **Defence Scientific Information & Documentation Centre (DESIDOC)** is a core laboratory under the **Defence Research and Development Organization (DRDO)**. It manages the Defence Science Library (DSL), Digital Library, and various e-Services for DRDO scientists. These services provide critical scientific resources, research materials, and technical documentation to support defense-related R&D.

Within DESIDOC, the DRDO eLibrary plays a vital role by maintaining a collection of:

- **75,000** books
- **100,000** technical reports
- **30,000** SPIE conference proceedings
- **600** online journals and **200** print periodicals
 -Special collections, including standards, specifications, and Jane’s publications for defense research

This vast repository also includes over **100,000** bound volumes of journals from top scientific publishers.

## 1.2 Problem Statement
Despite the extensive collection of valuable resources, the DRDO eLibrary faced significant challenges in its search functionality:

1. **Lack of Auto-Complete Suggestions:**  The absence of an auto-suggest feature required users to manually type full queries, increasing the likelihood of errors and making searches inefficient. This also failed to assist users by offering relevant or trending search terms.

2. **No Search Summary:** Users had to open individual books or journals to determine their relevance, leading to time-consuming and inefficient searches. The lack of a quick summary of results reduced the overall ease of accessing relevant materials.

These shortcomings significantly impacted the user experience, especially for researchers seeking to quickly locate specific scientific information in a time-sensitive environment.

## 1.3 The Solution
To resolve these issues, I designed and implemented AutoGen Search, a smart search engine for the DRDO eLibrary, incorporating the following features:

1. **Auto-Complete Suggestions:** An 'Auto-complete suggestions' feature that provides the user with real time search suggestions based on the database of available books, journals and other e-resources of the eLibrary. This improves search speed, reduces errors, and enhances user engagement.

2. **LLM powered search summary:** Using advanced Large Language Models (LLMs), this feature generates concise summaries of books and materials based on search queries. It allows users to quickly evaluate the relevance of resources without opening each one individually.

This solution significantly improves the user experience, making the DRDO eLibrary more intuitive and efficient for researchers.

# 2. AutoGen Search
## 2.1 Working Demo
Before delving into the architecture and technical details of AutoGen Search, let’s take a look at a working demo to demonstrate its functionalities in real-time -

https://github.com/user-attachments/assets/dea08050-bed4-4def-93d4-17ace03dfdeb

## 2.2 System Components and Working Overview 
AutoGen Search has 4 major components:

1. **User:** The user shall be web-based  

2. **Frontend:** Frontend consists of a webpage with a search bar for typing the user query (integrated with Autocomplete feature), a search button to send the query to the backend, and a results-display area displaying the user's search results

3. **Backend:** The backend consists of a Large Language Model integrated to provide users with a smart search result

4. **Elasticsearch:** Elasticsearch consists of probable search-queries indexed into its database. Whenever a partial query is sent to Elasticsearch, it quickly does a search against its indexed database and returns matching search-wuery sentences.

<img src = "https://github.com/Anchor27/Projects-Data-Repo/blob/main/flowchart_detailled.png" alt = "Flowchart">

_User search-prompt input_

1. User opens the search page having a search-bar, a search-button and a dedicated area for displaying the LLM powered search results.

2. User starts typing the search-query in the search bar.

_Auto-Complete suggestions_

3. The incomplete user query is sent to Elasticsearch.

4. Elasticsearch has an indexed database of the titles of books, journals and other scientific materials. Elasticsearch performs a search against this database.

5. Elasticsearch returns the list of sentences that match the user-search query to the frontend.

6. Frontend displays the list of Auto-complete suggestions in the form of a drop-down.

7. User can either select any of these Auto-complete suggestions or complete the query himself.

8. User presses the search-button which sends the query to the backend. 

_LLM powered search-results_ 

9. Backend processes the query and feeds it into the GPT 4 Turbo LLM. 

10. GPT generates the search results using a custom prompt specialized for generating search-engine like results.

11. The generated results are then sent to the frontend which is then displayed on the Webpage.

## 2.3 Components
## 2.3.1 Frontend
<img src = "https://github.com/Anchor27/Projects-Data-Repo/blob/main/frontend.png" alt = "Frontenc">
The Frontend of AutoGen Search is designed to be intuitive and responsive, ensuring a smooth user experience. It is developed using HTML, CSS, and JavaScript (jQuery) to facilitate the communication with the backend.

- **Search Bar:** A central feature allowing users to type their search queries. This input field is connected to the autocomplete feature powered by Elasticsearch.
- **Autocomplete Dropdown:** When a user begins typing, the frontend makes an asynchronous call (AJAX) to retrieve potential query completions from Elasticsearch.
- **Results Display:** After the user submits a query, the search results—generated by the LLM—are presented in a styled results section.

**<ins>Tech Stack</ins>**
- **CSS + HTML:** For the layout and styling of the webpage.
- **AJAX:** For asynchronous requests to ensure that users experience real-time interaction with the search bar.
- **jQuery:** To manipulate DOM elements dynamically.

**<ins>Key Files</ins>**
- **index.html:** Contains the UI elements such as the search bar, results section, and dropdown for autocomplete suggestions.
- **JavaScript/jQuery:** Handles events like text input, dropdown display, search button clicks and fetching results from the backend.
  
```html
<div id="suggestions-container" class="dropdown-content"></div>
Search
<div id="results-section">
  <h2>Generative AI Search Results</h2>
  <div id="result"></div>
</div>
```

 ## 2.3.2 Backend
<img src = "https://github.com/Anchor27/Projects-Data-Repo/blob/main/backend.png" alt = "Backend">
The backend forms the core of the AutoGen Search system, responsible for managing communication between the frontend, Elasticsearch, and the Large Language Model (LLM). The backend is implemented using Flask, a lightweight web framework in Python, which makes it highly modular and easy to extend. The key functions of the backend include:

- **Routing:** The backend routes requests from the frontend. For example, the `/autocomplete` route handles autocomplete requests, while the `/process_query` route manages LLM-powered query processing.
- **Elasticsearch Integration:** It sends partial user queries to Elasticsearch for fetching autocomplete suggestions in real-time.
- **LLM Integration:** The backend communicates with OpenAI’s GPT-4 Turbo model via the OpenAI API to generate summarized search results based on user queries.
- **JSON-based API:** The backend responds to both Elasticsearch and LLM requests in JSON format, ensuring seamless data exchange between the frontend and backend.

**<ins>Tech Stack</ins>**
- **Flask (Python):** Used for creating the web server and handling API requests.
- **OpenAI API:** For interfacing with GPT-4 Turbo to generate search summaries.
- **REST API:** Communication protocol between the frontend and backend.

**<ins>API Endpoints</ins>**

The backend exposes two key API endpoints that handle different functionalities:

- **/autocomplete:** Handles requests from the frontend to fetch autocomplete suggestions from Elasticsearch.
- **/process_query:** Sends user search queries to the GPT-4 Turbo LLM and returns summarized search results.

**<ins>Search Query Processing**</ins>

The backend logic can be broken down into two processes:

- **Autocomplete Processing:** When the user types into the search bar, the incomplete query is sent to the /autocomplete endpoint. The backend forwards this query to Elasticsearch, which returns a list of relevant suggestions. These suggestions are passed back to the frontend for display in the dropdown.
- **LLM Powered Search:** Once the user submits the search query by clicking the search button, the backend sends the query to the /process_query endpoint. Here, a custom prompt is sent to OpenAI's GPT-4 Turbo model to generate a concise summary of the search result. The summarized output is then returned to the frontend for display.

**<ins>Key Functions:</ins>**
- **suggest_from_elasticsearch(query):** Sends the query to Elasticsearch and retrieves matching indexed sentences.
- **process_query():** Prepares the LLM prompt, interacts with OpenAI API to get the response, and formats the output.

```python
  @app.route('/autocomplete', methods=['GET'])

    def autocomplete():
      query = request.args.get('query', '')
      if query:
        result = suggest_from_elasticsearch(query)
        return jsonify(result)

      else:
        return jsonify([])

    @app.route('/process_query', methods=['POST'])

    def process_query():
      query = request.form.get('query', '')

      if query:
        modified_prompt = f"You are a book summary generator. Your task is to provide a detailed summary of the book with title as {query}. If the book is not found in the database, return a message indicating that no book with that title exists. Use this format- Book Title: [Insert Book Title Here] <b> Author: [Insert Author Name Here] <b> Published: [Insert Year of Publication Here] <b> ISBN: [Insert ISBN Here] <b> Please provide a concise yet comprehensive summary, focusing on the main themes, key points, and the significance of the book."
        response = openai.Completion.create(
          model=OPENA_AI_MODEL,
          prompt=modified_prompt,
          temperature=DEFAULT_TEMPERATURE,
          max_tokens=250,
        )

        processed_query = f'{response["choices"][0]["text"]}'
        return jsonify(processed_query)

      else:
        return jsonify({'error': 'Invalid query'})
```

## 2.3.3 Elasticsearch
<img src="https://github.com/Anchor27/Projects-Data-Repo/blob/main/elasticsearch.jpeg" alt="Elasticsearch">
Elasticsearch is a distributed, RESTful search engine that provides real-time search and analytics for structured and unstructured data. In the AutoGen Search system, Elasticsearch is used to handle autocomplete suggestions based on the user’s partially typed query. Here’s how Elasticsearch fits into the architecture:

- **Indexing Queries:** A database of titles of various books, journals and other scientific publications of DRDO eLibrary is indexed into Elasticsearch. It stores relevant search terms and content to provide fast and efficient autocomplete functionality.
- **Real-Time Search:** When a user types in the search bar, Elasticsearch receives the partial query and searches the indexed database in real-time. It then returns matching suggestions that appear in the frontend dropdown.
- **Scalable:** Elasticsearch allows for scalable querying, which means even as the database grows in size, it can handle large volumes of autocomplete requests with minimal latency.

<ins>**Tech Stack**</ins>

- **Elasticsearch Engine:** For indexing and querying data in real-time.
- **Elasticsearch Python Client:** Facilitates the communication between the Flask backend and Elasticsearch.

Configuration:

- Elasticsearch is set up on localhost:9200.
- **Index:** drdo_search_query_index
- **Query Matching Logic:** Uses the match operator to ensure that suggestions closely match the input string.

Example Elasticsearch query structure that searches the title field in the indexed database for matches based on the user’s input - 
```python
body = {
    "query": {
        "match": {
            suggestion_field: {
                "query": query,
                "operator": "and"
            }
        }
    }
}
```
## 2.3.4 Large Language Model (LLM)
<img src = "https://github.com/Anchor27/Projects-Data-Repo/blob/main/LLM.png" alt = "Large Language Model (LLM)">
The Large Language Model (LLM), specifically OpenAI's GPT-4 Turbo, serves as the key component responsible for generating search results. Rather than simply fetching pre-indexed information, the LLM dynamically generates custom summaries based on the user’s search query, offering a more refined and context-aware response compared to traditional search engines. 

Key aspects of this component include:
- **Custom Query Understanding:** The LLM is able to parse and understand the user’s full query contextually, including nuances and intent. This allows it to generate tailored responses that directly address the user's search.
- **Dynamic Summarization:** Instead of returning a list of links or documents, GPT-4 Turbo processes the query and generates a custom summary of relevant information. This makes the search results more concise, direct, and useful for users seeking quick answers.
- **Real-Time Interaction:** The backend sends the user’s search query to GPT-4 Turbo via the OpenAI API in real-time. The LLM processes the request and returns a generated summary based on its training data.
- **API Integration:** The communication between the backend and the LLM occurs through OpenAI's API. The backend formulates a request containing the search query, sends it to the GPT model, and returns the generated summary to the frontend for display.

<ins>**Tech Stack**</ins>
- **GPT-4 Turbo:** The core engine that generates search results, providing intelligent and contextually relevant summaries.
- **REST API:** This API manages the communication between the Flask backend and the GPT model, ensuring efficient query submission and result retrieval.

<ins>**Functionality**</ins>
- When the user submits a search, the backend sends a carefully crafted prompt to GPT-3.5. This prompt includes the user’s query and specific instructions to generate a concise, insightful summary.
- LLM Configuration:
-- Model: gpt-4-turbo-instruct
-- Max Tokens: Limits the response to 250 tokens, ensuring that the summary is concise and directly related to the query.

<ins>**Technical Consideration**</ins>
- **Temperature Setting:** The temperature is set to ``1``, allowing the model to generate creative responses. This provides flexibility in how the LLM forms summaries while maintaining factual accuracy.
- **Custom Prompt:** The prompt is designed to ensure that the LLM produces a clear, focused summary tailored to the user's query.

# 3. Setup
## 3.1 Prerequisites
- **OS:** The following installation procedure mentioned is for Debain-based Linux Distros. But, it can run in other Linux Distros, Windows and MacOS by making necessary changes.
- **Dependencies:** Install the following dependencies, required for the setup to run:
  ```bash
  sudo apt update                # Update the package index
  sudo apt install git           # Install Git
  sudo apt install wget          # Install wget
  sudo apt install unzip         # Install unzip
  ```
- **Web Browser:** AutoGen Search can run in any of the updated browsers.

  
## 3.2 Installation


### 3.2.1 Using `git clone`
**Step 1:** Clone the GitHub Repository
```bash
git clone https://github.com/Anchor27/AutoGen-Search.git
```
**Step 2:** Setup the setup.sh
```bash
cd ./AutoGen-Search/
chmod +x ./setup.sh
```
**Step 3:** Run setup.sh
```bash
./setup.sh
```


### 3.2.2 Using zip file
**Step 1:** Download the zip file
```bash
wget https://github.com/Anchor27/AutoGen-Search/blob/main/AutoGen-Search.zip
```
**Step 2:** Unzip the downloaded file
```bash
unzip ./AutoGen-Search.zip
```
**Step 3:** Setup the setup.sh
```bash
cd ./AutoGen-Search/
chmod +x ./setup.sh
```
**Step 4:** Run setup.sh
```bash
./setup.sh
```


## 3.3 Setup Elasticsearch Index and OpenAI API Key
**Elsaticsearch Index**
- Run Elastic search engine:
  ```bash
  cd /path/to/AutoGen-Search/installation/direcory
  ./elasticsearch/bin/elasticsearch
  ```
- Run Kibana engine:
  ```bash
  cd /path/to/AutoGen-Search/installation/direcory
  ./kibana/bin/kibana
  ```
- Open Kibana using localhost provided, which is `http://localhost:5601/` by default.
- Index the search-query databse using Kibana GUI. You may use the dummy dataset `book-titles.json` given along AutoGen-Search.
- Use Index name as `book_titles` which is used by default in `/src/app.py`. If you keep any other index-name, kindly change the name in line no. 24 of `/src/app.py`.

**OpenAI API**
- Open AI has it's own API keys which are required in order to access thier models. You can go to https://platform.openai.com/docs/overview and select the API required, which is `GPT-3.5-turbo-instruct` in our case.
- Once you have the API, open the `app.py` file present in `/src` in a text editor and replace `<YOUR OWN OPEN AI API KEY HERE>` with your OpenAI API Key in line number 44.


## 3.4 Running AutoGen Search
**Step 1:** Go to the installation directory
```bash
cd /path/to/AutoGen-Search/installation/direcory
```
**Step 2:** Run AutoGen-Search fom terminal:
``` bash
./autogen-search.sh
```

_ENJOY YOU AI POWERED SEARCH EXPERIENCE WITH AUTCOMPLETE FEATURE!_
