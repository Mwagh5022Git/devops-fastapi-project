from fastapi import FastAPI
from prometheus_client import Counter, generate_latest
from fastapi.responses import Response

app = FastAPI()

REQUEST_COUNT = Counter("request_count", "Total Requests")

@app.get("/")
def home():
    REQUEST_COUNT.inc()
    return {"message": "DevOps FastAPI Project Running"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type="text/plain")
