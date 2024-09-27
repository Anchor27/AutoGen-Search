This repository details my internship experience at the **Defence Scientific Information & Documentation Centre (DESIDOC)**, a laboratory under the **Defence Research and Development Organization (DRDO)**, from January 2024 to March 2024. During my internship, I developed **AutoGen Search** for the DRDO eLibrary, an AI-powered search engine. The software features an Autocomplete function to assist users in crafting better search queries and an AI-driven Search Summary feature, providing concise summaries of various books and journals available in the eLibrary.

_To view the blog version, please follow here: https://sites.google.com/view/aryan-joshi/tech-blogs/drdo_

# AutoGen-Search
<img src="https://github.com/Anchor27/Projects-Data-Repo/blob/main/AUTOGEN%20LOGO%20LARGE.png" alt="Project Logo"/>

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

