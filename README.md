# Telegram Calendar n8n

An n8n workflow that turns natural-language Telegram messages into Google
Calendar events. Gemini extracts the event details; if the request is missing a
date or time, the bot asks a concise follow-up question.

## What you need

- A Telegram bot token from `@BotFather`
- A Google Cloud OAuth client with Google Calendar API enabled
- A Gemini API key
- A Render account

Do not commit any of these secrets.

## Deploy on Render free

1. Create a Render **Web Service** from this repository.
2. Select the included `render.yaml` configuration, or use Docker with the
   included `Dockerfile`.
3. Set `N8N_ENCRYPTION_KEY` to a long random value.
4. After Render gives you an HTTPS URL, set both `N8N_EDITOR_BASE_URL` and
   `WEBHOOK_URL` to that URL.
5. Set `N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD`.
6. Set `GEMINI_API_KEY`.
7. Open the n8n editor, import `workflow.json`, and configure the three
   credentials referenced by the workflow.
8. Activate the workflow.

Render's free service can sleep after inactivity. Telegram messages may be
delayed while the service wakes. Render's filesystem is also ephemeral, so
export the workflow and credentials or use persistent storage before relying on
the instance for production data.

## Example messages

```text
Meeting with Ana tomorrow at 3pm for 45 minutes
Dentist on Friday at 10:00 in Tbilisi
Call the design team next Monday at 14:00, 30 minutes, online
```

The bot replies with the created event's title and Google Calendar link.
