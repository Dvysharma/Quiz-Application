# Patch summary for RAG/Flask/Streamlit integration

## Files to be modified:
- backend/app.py: Update /api/query and /api/query/stream to use RAG.ask and return sources.
- backend/ai_model.py: Remove direct LLM calls for query endpoints.
- backend/rag/query.py: Add logging, robust Ollama fallback, and provenance.
- frontend/caichat.py: Display answer and sources in UI.

## Reasoning
- Ensures all queries go through the RAG pipeline, not direct LLM.
- Makes provenance visible in UI and logs.
- Adds robust error handling and logging for debugging and monitoring.

## Next steps
- Patch backend/app.py to import and use RAG for /api/query and /api/query/stream.
- Patch backend/rag/query.py for logging and fallback.
- Patch frontend/caichat.py to show sources.
- Test with positive/negative/streaming queries and check logs and UI.
