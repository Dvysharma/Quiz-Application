
# Campus Connect AI

Campus Connect AI is a comprehensive platform designed for UPES students and faculty to seamlessly access campus resources, services, and information. It leverages AI-powered search and a modern web interface to enhance the campus experience for all users.


## Key Features

- **Faculty Directory:** Search and connect with faculty members across departments.
- **Campus Services:** Access information about various campus services and facilities.
- **AI-Powered Smart Search:** Get instant answers to campus-related queries using Llama 3.
- **FAQs & Announcements:** Stay updated with the latest campus news and frequently asked questions.
- **Secure Access:** SSL-enabled backend for secure communication.


## Getting Started

### Backend Setup
1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd campus-connect-ai/backend
   ```
2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
3. **Install Ollama and Llama 3:**
   ```bash
   curl https://ollama.ai/install.sh | sh
   ollama pull llama3
   ```
4. **(Optional) Set up environment variables:**
   ```bash
   cp .env.example .env
   # Edit .env as needed
   ```
5. **Run the backend server:**
   ```bash
   python app.py
   # or for SSL:
   flask run --port=5001 --debug --cert=ssl/cert.pem --key=ssl/key.pem
   ```
6. **API Example:**
   ```bash
   curl -X POST http://127.0.0.1:5000/api/query \
     -H "Content-Type: application/json" \
     -d '{"prompt": "tell me about UPES college india ?"}'
   ```

### Frontend Usage
1. Open `frontend/templates/index.html` or other HTML files in your browser.
2. Static assets (CSS, JS, images) are in `frontend/static/`.
3. For development, you may use a simple HTTP server:
   ```bash
   cd frontend
   python -m http.server 8000
   # Then visit http://localhost:8000/templates/index.html
   ```


## Project Structure

```
campus-connect-ai/
├── backend/
│   ├── app.py
│   ├── ai_model.py
│   ├── knowledge_base.json
│   ├── requirements.txt
│   ├── ssl/
│   ├── faculty/
│   └── ...
├── frontend/
│   ├── templates/
│   │   ├── index.html
│   │   └── ...
│   └── static/
│       ├── css/
│       ├── js/
│       ├── images/
│       └── ...
└── README.md
```


## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/YourFeatureName`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeatureName`)
5. Create a new Pull Request


## Developed By

**Aditya Goyal**

## License

This project is licensed under the MIT License.

## Contact

For questions, suggestions, or support, please contact [adityism](mailto:adityism@gmail.com).