from flask import Flask, render_template, request, jsonify
from elasticsearch import Elasticsearch

app = Flask(__name__)
es = Elasticsearch([{'host': 'localhost', 'port': 9200, 'scheme': 'http'}])

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/autocomplete', methods=['GET'])
def autocomplete():
    query = request.args.get('query', '')
    if query:
        result = suggest_from_elasticsearch(query)
        return jsonify(result)
    else:
        return jsonify([])


def suggest_from_elasticsearch(query):
    index_name = 'book_titles'
    suggestion_field = 'title'

    body = {
        "query": {
            "match": {
                suggestion_field: {
                    "query": query,
                    "operator": "and"  # You can adjust the operator based on your preference
                }
            }
        }
    }
    result = es.search(index=index_name, body=body)
    suggestions = result['hits']['hits']
    return [suggestion['_source'][suggestion_field] for suggestion in suggestions]

# CHAT GPT BASIC DEFINING
from openai import OpenAI

client = OpenAI(api_key="<YOUR OPEN AI API KEY HERE>")


OPENA_AI_MODEL = "gpt-3.5-turbo-instruct"
DEFAULT_TEMPERATURE = 1


@app.route('/process_query', methods=['POST'])
def process_query():
    query = request.form.get('query', '')
    if query:
        modified_prompt = f"You are a book summary generator. Your task is to provide a detailed summary of the book with title as {query}. If the book is not found in the database, return a message indicating that no book with that title exists. Use this format- Book Title: [Insert Book Title Here] <b> Author: [Insert Author Name Here] <b> Published: [Insert Year of Publication Here] <b> ISBN: [Insert ISBN Here] <b> Please provide a concise yet comprehensive summary, focusing on the main themes, key points, and the significance of the book."

        response = client.completions.create(model=OPENA_AI_MODEL,
        prompt=modified_prompt,
        temperature=DEFAULT_TEMPERATURE,
        max_tokens=250,
        n=1,
        stop=None,
        presence_penalty=0,
        frequency_penalty=0.1)
        processed_query = f'{response.choices[0].text}'
        return jsonify(processed_query)
    else:
        return jsonify({'error': 'Invalid query'})


if __name__ == '__main__':
    app.run(debug=True)
