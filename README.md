# Native iOS Recipe App

Developed a native iOS app that allows users to browse recipes using the [MealDB API](https://themealdb.com/api.php) for Fetch iOS Coding Challenge.

The app utilizes two endpoints:

- [https://themealdb.com/api/json/v1/1/filter.php?c=Dessert](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert) for fetching the list of meals in the Dessert category.
- [https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID](https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID) for fetching the meal details by its ID.

The app displays a list of meals in the Dessert category, sorted alphabetically. When the user selects a meal, they are taken to a detail view that includes the following information:

- Meal name
- Instructions
- Ingredients/measurements

## Highlights

- To improve user experience, I implemented the `.searchable` view modifier to enable filtering of the list of desserts
- To ensure the reliability of my code, I used `XCTest` to write unit tests that specifically targeted the JSON decoding process & parsing model data
- To maintain code organization and separation of concerns, I chose to use the `MVVM` architecture, which separates models, views, and business logic
- To keep up with modern development practices, I opted for the newer `async/await` methods of URLSession
- To ensure consistent visual design, I used colors that comply with both dark and light modes. Additionally, to provide a more immersive experience, I included a "watch video" button that takes the user to the recipe video in the detail view
- To ensure that the app displays only meaningful data, I added a filter to remove any `null` or `empty` values from the API before displaying them
