
import os
import firebase_admin
from firebase_admin import credentials, auth
from fastapi import Depends, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials

security = HTTPBearer(auto_error=False)


def verify_firebase_token(
    token: HTTPAuthorizationCredentials | None = Depends(security)
):
    if token is None:
        raise HTTPException(
            status_code=401,
            detail="Please log in first"
        )

    try:
        if not firebase_admin._apps:
            key_path = os.getenv(
                "GOOGLE_APPLICATION_CREDENTIALS",
                "serviceAccountKey.json"
            )

            if not os.path.isfile(key_path):
                raise HTTPException(
                    status_code=503,
                    detail="Firebase credentials not configured"
                )

            firebase_admin.initialize_app(
                credentials.Certificate(key_path)
            )

        decoded_token = auth.verify_id_token(token.credentials)
        return decoded_token

    except HTTPException:
        raise

    except Exception as error:
        print("Firebase verification error:", error)
        raise HTTPException(
            status_code=401,
            detail="Invalid or expired Firebase token"
        )
