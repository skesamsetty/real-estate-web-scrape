# real-estate-web-scrape


<br />
<p align="center">

  <h3 align="center">Web Scraping - Real Estate</h3>

  <p align="center">
    This project is based on a Python script that collects property listings from a Real Estate website and loads it into a CSV file and a SQL database.
    <br />
    <a href="https://github.com/kevogil/real-estate-web-scrape"><strong>Repo»</strong></a>
    <br />
  </p>
</p>

### Installation

1. Install Beautiful Soup
```
  pip install beautifulsoup4
```
2. Install Pandas
```
  pip install pandas
```
3. Install Splinter
```
  pip install splinter
```
4. Install Jupyter
```
  pip install jupyter
```
5. Run Jupyter
```
  jupyter notebook
```
6. Import modules
```
  import pandas as pd
  import re

  from splinter import Browser
  from webdriver_manager.chrome import ChromeDriverManager
  from bs4 import BeautifulSoup as bs
  from random import randint
  from time import sleep
```


### Extraction Process

1. Identify cities to collect property information on
```
  cities = ['Los-Angeles_CA','New-York_NY', 'Chicago_IL', 'Houston_TX']
```
2. Open chromedriver browser and navigate to the search results with variables for the city and page number
```
  url = f"https://www.realtor.com/realestateandhomes-search/{city}/pg-{i}"

  browser = init_browser()
  browser.visit(url)
```
3. Create html object, parse html with BeautifulSoup, and identify all property listing results
```
  html = browser.html
  soup = bs(html, "html.parser")

  listings = soup.find_all('li', attrs={"data-testid": "result-card"})
```
4. Identify the attributes from each property card, including the href to the listing details page
```
  price = listing.find('span', attrs={"data-label": "pc-price"}).text.strip('$')
  bed = int(listing.find('li', attrs={"data-label": "pc-meta-beds"}).text.strip('bed'))
  bath = float(listing.find('li', attrs={"data-label": "pc-meta-baths"}).text.strip()[0])
  size = listing.find('li', attrs={"data-label": "pc-meta-sqft"}).text.strip('sqft')
  address = listing.find('div', attrs={"data-label": "pc-address"}).text
  status = listing.find('span', attrs={"class": "jsx-3853574337 statusText"}).text
  detail_page = listing.find('a').get('href')
```
5. Loop through each listing and each city
```
  for city in cities:
    for listing in listings:     
```
6. In a second 'for' loop, navigate to each href
```
  for detail_page in detail_pages:
    detail_url = f"https://www.realtor.com{detail_page}"
    browser.visit(detail_url)
```
7. Identify all property information contained under 'listing_indicators'
```
  details = detail_soup.find('div', attrs={"data-testid": "listing-indicator"})
```
8. Identify the attributes from each listing
```
  property_type = listing_indicators['Property Type']
  hoa_fee = listing_indicators['HOA Fees'].strip('/mo')
  pricesqft = listing_indicators['Price per sqft'].strip('$')
  garage = listing_indicators['Garage'].strip(' car')
  year = listing_indicators['Year Built']
```
9. Add all attributes to dataframe
```
  df = pd.DataFrame({'Address': addresses, 'Status': status, 'Property Type': types, 'Price': prices, 'Price per sqft': pricesqfts, 'HOA Fees': fees, 'Bed': beds, 'Bath': baths, 'Size': sizes, 'Garage': garages, 'Year Built': years})
```
10. Export dataframe to csv
```
  df.to_csv('listings.csv', index=False)
```


### Extracted Information 

`Address`
`Status`
`Property Type`
`Price`
`Price per sqft`
`HOA Fees`
`Bed`
`Bath`
`Size`
`Garage`
`Year Built`
`Status`




