import pandas as pd 

#read in csv
breweries_df = pd.read_csv("ETL/breweries.csv")

# #fix up zipcodes
for i, row in breweries_df.iterrows():
  if str(row['postalCode']) == 'nan':
    continue
  if len(str(row['postalCode'])) > 5:
    breweries_df['postalCode'].at[i] = str(row['postalCode'])[:5]
  if len(str(row['postalCode'])) < 5:
    while len(str(breweries_df['postalCode'].at[i])) < 5:
      breweries_df['postalCode'].at[i] = str("0{}".format(breweries_df['postalCode'].at[i]))

#output into csv
export_csv = breweries_df.to_csv ('breweries_refined.csv', index = None, header=True) 