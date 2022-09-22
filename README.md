# shiny-iNaturalist
plotting data from iNaturalist web

<b> Description </b>

Shiny app uses the "rinat" package which allows to load the data from iNaturalist web and plot them using the "leaflet" package.

The "leaflet" package uses the OpenStreet data and several designs of a map, and some of them can be chosen using this Shiny iNaturalist app.

First step is to write an animal name you wish to plot. We are plotting rats.

![image](https://user-images.githubusercontent.com/67751914/191743220-d4a58ee0-9678-4aa9-874d-081387bb7354.png)

There are two types of application:

<b> 1. </b>  First one allows to chose the country you would like to visualize.

![image](https://user-images.githubusercontent.com/67751914/191743544-9e2c34fa-d04e-450c-8048-8433f548d866.png)

This is the output

<img width="946" alt="1" src="https://user-images.githubusercontent.com/67751914/191741800-0778670c-4416-4371-912f-103bd64c8759.png">

You can choose different map designs provided by "leaflet" package, and countries.

<img width="945" alt="2" src="https://user-images.githubusercontent.com/67751914/191743871-4c450573-2b60-42bf-b03a-fcfb348b8c05.png">

<img width="950" alt="4" src="https://user-images.githubusercontent.com/67751914/191743866-babcb1e2-8834-45af-9e1b-93e0ea5e411a.png">

<b> 2. </b> Second app allows to choose lat and lon manually.

![image](https://user-images.githubusercontent.com/67751914/191744235-4ea2766e-f01a-4ac9-a31f-7765688d3b1b.png)

For example lets plot seagulls in Sicily.

![image](https://user-images.githubusercontent.com/67751914/191744675-0172d090-021f-4f49-9063-d19bddf965be.png)
