from locust import HttpUser, task, between

class WeatherUser(HttpUser):
    # Simulate a wait time between tasks to mimic real user behavior
    wait_time = between(1, 3)# Wait between 1 to 3 seconds after each task

    @task
    def get_current_temp(self):
        # Make a GET request to your endpoint
        self.client.get("/current_temperature/?city_name=London&country_code=GB")
