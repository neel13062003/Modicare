import sys
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# read in the data from CSV
data = pd.read_csv('pizza.csv')


# preprocess the data
preprocessed_data = data['pizzaName'] + ' ' + data['pizzaDesc']

# create a TF-IDF vectorizer
tfidf_vectorizer = TfidfVectorizer()

# fit and transform the vectorizer on the preprocessed data
tfidf_matrix = tfidf_vectorizer.fit_transform(preprocessed_data)

# calculate the cosine similarity matrix
cosine_sim_matrix = cosine_similarity(tfidf_matrix)

# get the index of the pizza to use as a reference for the recommendations
pizza_index = int(sys.argv[1])

# get the top 5 most similar pizzas
similar_pizzas = list(enumerate(cosine_sim_matrix[pizza_index]))
sorted_similar_pizzas = sorted(similar_pizzas, key=lambda x:x[1], reverse=True)[1:6]
top_5_pizza_indices = [i[0] for i in sorted_similar_pizzas]

# get the pizza names and descriptions
output_data = []
for i in top_5_pizza_indices:
    output_data.append({'name': data.loc[i, 'pizzaname'], 'description': data.loc[i, 'pizzadescription']})

# print the output in JSON format
print(json.dumps(output_data))
