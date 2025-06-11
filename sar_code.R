SAR<-read.csv("C:/Users/kasub/Desktop/CSDA 6010/PROJECT_1/SAR Rental.csv")
SAR
-----------------------------------------------------------------------------
##Checking the data
# View the structure of the dataset
str(SAR)

# Summary statistics for each column
summary(SAR)

# Check for missing values
colSums(is.na(SAR))

# Check for duplicated rows
sum(duplicated(SAR))

--------------------------------------------------------------------------------
## Data Pre - Processing

# Convert the 'Booking Created', 'from_date', 'to_date' to date-time format
#install.packages("lubridate")
library(lubridate)

SAR$from_date = as.POSIXct(SAR$from_date, format = '%m/%d/%Y %H:%M' )
SAR$to_date = as.POSIXct(SAR$to_date, format = '%m/%d/%Y %H:%M')
SAR$booking_created = as.POSIXct(SAR$booking_created, format = '%m/%d/%Y %H:%M')

# Verify the change
str(SAR)

# Using lat long values
library(httr)
library(jsonlite)

# Define latitude and longitude
latitude <- 37.7749
longitude <- -122.4194

# Construct URL
url <- paste0("https://nominatim.openstreetmap.org/reverse?lat=", 
              latitude, "&lon=", longitude, "&format=json")

# Perform the request
response <- GET(url)


# Parse the JSON response
location_data <- fromJSON(content(response, as = "text"))
location_data
print(location_data$display_name)  # Area name or full address

#--------------------------------------------------------------------------------
## Distance
library(dplyr)
# Function to calculate distance between two points using Haversine formula
calculate_distance <- function(lat1, lon1, lat2, lon2) {
  # Convert decimal degrees to radians
  lat1_rad <- lat1 * pi / 180
  lon1_rad <- lon1 * pi / 180
  lat2_rad <- lat2 * pi / 180
  lon2_rad <- lon2 * pi / 180
  
  # Radius of the Earth in kilometers
  R <- 6371
  
  # Differences in coordinates
  dlat <- lat2_rad - lat1_rad
  dlon <- lon2_rad - lon1_rad
  
  # Haversine formula
  a <- sin(dlat/2)^2 + cos(lat1_rad) * cos(lat2_rad) * sin(dlon/2)^2
  c <- 2 * atan2(sqrt(a), sqrt(1-a))
  
  # Calculate distance
  distance <- R * c
  
  return(distance)
}

# Add distances to your SAR dataframe
SAR <- SAR %>%
  rowwise() %>%
  mutate(
    distance_km = calculate_distance(from_lat, from_long, to_lat, to_long),
    distance_miles = distance_km * 0.621371  # Convert to miles if needed
  ) %>%
  ungroup()

SAR

library(readr)
write.csv(SAR, file = "C:/Users/kasub/Desktop/SAR.csv", row.names = FALSE)


SAR_1 <- SAR[, -c(1, 4, 8, 9, 15, 16, 17, 18)]
print(SAR_1)

SAR <- SAR %>% filter(!is.na(to_area_id ))

str(SAR)

#-----------------------------------
library(dplyr)
library(ggplot2)
library(reshape2)

# Assuming your dataframe is called SAR
# Select only numeric columns for correlation
numeric_columns <- SAR %>% 
  select_if(is.numeric)

# Calculate correlation matrix
correlation_matrix <- cor(numeric_columns, use = "complete.obs")

# Create correlation heatmap using ggplot2
ggplot(data = melt(correlation_matrix), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0,
    limits = c(-1, 1)
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title = element_blank()
  ) +
  geom_text(aes(label = round(value, 2)), size = 3) +
  labs(title = "Correlation Heatmap", fill = "Correlation")

# If you want to save the correlation matrix to a CSV file
write.csv(correlation_matrix, "correlation_matrix.csv")

# Print the correlation matrix in the console
print(round(correlation_matrix, 2))