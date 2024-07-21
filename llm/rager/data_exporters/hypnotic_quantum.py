import numpy as np
import spacy
from elasticsearch import Elasticsearch

nlp = spacy.load('en_core_web_sm')


@data_exporter
def search(*args, **kwargs):
    query = '...'
    
    doc = nlp(query)
    tokens = [token.lemma_ for token in doc]
    
    text = ' '.join(tokens)
    doc = nlp(text)
    query_embedding = np.mean([token.vector for token in doc], axis=0).tolist()
    
    script_query = dict(
        script_score=dict(
            query=dict(match_all=dict()),
            script=dict(
                source="cosineSimilarity(params.query_vector, 'embedding') + 1.0",
                params=dict(query_vector=query_embedding)
            )
        )
    )

    es_client = Elasticsearch('http://host.docker.internal:9200')
    
    response = es_client.search(
        index='documents',
        body=dict(
            size=5,
            query=script_query,
            _source=['chunk'],
        )
    )
    return [[hit['_source'] for hit in response['hits']['hits']]]