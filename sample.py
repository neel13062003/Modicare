import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# read in the data from CSV
data = pd.read_csv('pizza.csv')

# preprocess the data
data['pizzaName'] = data['pizzaName'].apply(lambda x: x.lower()) # convert to lowercase
data['pizzaDesc'] = data['pizzaDesc'].apply(lambda x: x.lower()) # convert to lowercase

# create a TF-IDF vectorizer
tfidf_vectorizer = TfidfVectorizer()

# fit and transform the vectorizer on the preprocessed data
tfidf_matrix = tfidf_vectorizer.fit_transform(data['pizzaName'] + ' ' + data['pizzaDesc'])

# get the index of the pizza to use as a reference for the recommendations
pizza_name = 'Well Amla'
pizza_index = data[data['pizzaName'] == pizza_name.lower()].index[0]

# calculate the cosine similarity matrix
cosine_sim_matrix = cosine_similarity(tfidf_matrix)

# get the top 5 most similar pizzas
similar_pizzas = list(enumerate(cosine_sim_matrix[pizza_index]))
sorted_similar_pizzas = sorted(similar_pizzas, key=lambda x:x[1], reverse=True)[1:6]
top_5_pizza_indices = [i[0] for i in sorted_similar_pizzas]

# get the pizza names and prices
output_data = []
for i in top_5_pizza_indices:
    output_data.append({'name': data.loc[i, 'pizzaName'], 'price': data.loc[i, 'pizzaPrice'], 'desc': data.loc[i, 'pizzaDesc']})

# print the output
print(output_data)
