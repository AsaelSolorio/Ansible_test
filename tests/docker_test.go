package test

import (
	"io"
	"net/http"
	"os"
	"os/exec"
	"testing"
	"time"

	"github.com/joho/godotenv"
	"github.com/stretchr/testify/assert"
)

func TestDockerComposeWeatherAPI(t *testing.T) {
	err := godotenv.Load("../.env")
	if err != nil {
		t.Fatalf("Error loading .env file: %v", err)
	}

	apiKey := os.Getenv("API_KEY")
	if apiKey == "" {
		t.Fatalf("API_KEY is not set in the environment")
	}

	// Start docker-compose
	cmd := exec.Command("docker-compose", "up", "--build", "-d")
	if err := cmd.Run(); err != nil {
		t.Fatalf("Failed to start docker-compose: %v", err)
	}

	defer func() {
		cmd = exec.Command("docker-compose", "down")
		if err := cmd.Run(); err != nil {
			t.Logf("Failed to stop docker-compose: %v", err)
		}
	}()

	time.Sleep(15 * time.Second) // Wait for a while to let the app initialize

	response, err := http.Get("http://localhost:8001/health") // Ensure you have this endpoint in your FastAPI app
	if err != nil {
		t.Fatalf("Error making HTTP request: %v", err)
	}
	defer response.Body.Close()

	assert.Equal(t, http.StatusOK, response.StatusCode, "Expected status code 200")

	body, err := io.ReadAll(response.Body)
	if err != nil {
		t.Fatalf("Error reading response body: %v", err)
	}

	t.Logf("Response body: %s", string(body))
}
