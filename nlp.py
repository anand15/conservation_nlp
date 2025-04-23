import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin



url = "https://www.biodiversitylibrary.org/bibliography/7414"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

for link in soup.find_all('a'):
    print(link.get('href'))
    
bnhs_links = []  # Initialize an empty list to store the links

for link in soup.find_all('a'):
    href = link.get('href')
    if href and 'bom' in href:
        bnhs_links.append(href)  # Append the link to the list

print(bnhs_links)  # Print the list of links containing 'bom'

# Define the name of the output text file
output_file_bnhs_links = 'bnhs_links.txt'

# Write the list of bom_links to a text file
with open(output_file_bnhs_links, 'w') as f:
    for link in bnhs_links:
        f.write(link + '\n')

print(f"All bnhs_links written to {output_file_bnhs_links}")



# Function to extract PDF links from a given URL
def extract_pdf_links_from_url(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')
            pdf_links = [link.get('href') for link in soup.find_all('a', href=True) if link['href'].endswith('.pdf')]
            return pdf_links
        else:
            print(f"Failed to fetch URL: {url} - Status code: {response.status_code}")
            return []
    except Exception as e:
        print(f"Error extracting PDF links from {url}: {e}")
        return []

# Initialize an empty list to store all PDF links
all_pdf_links = []

# Iterate through each link in bom_links
for idx, link in enumerate(bnhs_links, start=1):
    print(f"Extracting PDF links from page {idx}/{len(bnhs_links)}: {link}")
    pdf_links_on_page = extract_pdf_links_from_url(link)
    if pdf_links_on_page:
        print("PDF links on this page:")
        for pdf_link in pdf_links_on_page:
            all_pdf_links.append(pdf_link)

print("All PDF links:")
for pdf_link in all_pdf_links:
    print(pdf_link)

len(all_pdf_links)
len(bnhs_links)

output_file = 'pdf_links.txt'

# Write the list of all PDF links to a text file
with open(output_file, 'w') as f:
    for pdf_link in all_pdf_links:
        f.write(pdf_link + '\n')

print(f"All PDF links written to {output_file}")

print(all_pdf_links)
#####################
#####################

# Iterate through each PDF link and convert it to the desired format
formatted_pdf_links = []
for pdf_link in all_pdf_links:
    formatted_pdf_link = f"https://archive.org/download/{pdf_link[:-4]}/{pdf_link}"
    formatted_pdf_links.append(formatted_pdf_link)

# Print the formatted PDF links for verification
for idx, formatted_pdf_link in enumerate(formatted_pdf_links, start=1):
    print(f"Formatted PDF link {idx}: {formatted_pdf_link}")

output_file = 'formatted_pdf_links.txt'

# Write the list of all PDF links to a text file
with open(output_file, 'w') as f:
    for pdf_link in formatted_pdf_links:
        f.write(pdf_link + '\n')

########

# doing this again on the part of the file, because it got stucks

# Define the filename of the text file
filename = 'formatted_pdf_links2.txt'

# Read the contents of the text file and store them in a list
formatted_pdf_links2 = []
with open(filename, 'r') as file:
    for line in file:
        formatted_pdf_links2.append(line.strip())



# Create a directory to save the PDF files if it doesn't exist
if not os.path.exists('downloaded_pdfs'):
    os.makedirs('downloaded_pdfs')

# Function to download PDFs from a given URL
def download_pdf(url, filename):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            with open(filename, 'wb') as f:
                f.write(response.content)
            print(f"Downloaded: {filename}")
        else:
            print(f"Failed to download PDF: {url} - Status code: {response.status_code}")
    except Exception as e:
        print(f"Error downloading PDF from {url}: {e}")

# Iterate through each formatted PDF link and download the PDF files
for idx, formatted_pdf_link in enumerate(formatted_pdf_links2, start=1):
    try:
        # Extract the filename from the formatted PDF link
        filename = formatted_pdf_link.split('/')[-1]

        # Download the PDF file
        download_pdf(formatted_pdf_link, os.path.join('downloaded_pdfs', filename))
    except Exception as e:
        print(f"Error processing PDF link {idx}: {e}")


############



# Function to download the article
def download_article(url, output_folder):
    try:
        # Send a GET request to the URL
        response = requests.get(url)
        if response.status_code == 200:
            # Parse the HTML content
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Find the main content of the article
            article_content = soup.find('div', class_='class-name-of-article-content')
            
            # Extract text or other relevant information from the article content
            # For example:
            article_text = article_content.text
            
            # Save the article content to a file
            output_file = os.path.join(output_folder, 'article.txt')
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(article_text)
            
            print("Article downloaded successfully!")
        else:
            print(f"Failed to fetch URL: {url} - Status code: {response.status_code}")
    except Exception as e:
        print(f"Error downloading article from {url}: {e}")

# URL of the article
article_url = "https://indianforester.co.in/index.php/indianforester/article/view/169751"

# Output folder to save the downloaded article
output_folder = "downloaded_articles"

# Create the output folder if it doesn't exist
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Download the article
download_article(article_url, output_folder)

f = requests.get(article_url)
soup = BeautifulSoup(f.content)
print(soup)
