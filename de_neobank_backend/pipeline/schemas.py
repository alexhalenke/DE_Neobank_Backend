bigquery_schemas = {
    "devices": [
        {"name": "string_field_0", "type": "STRING", "mode": "REQUIRED"},
        {"name": "string_field_1", "type": "STRING", "mode": "REQUIRED"},
    ],
    "notifications": [
        {"name": "reason", "type": "STRING", "mode": "REQUIRED"},
        {"name": "channel", "type": "STRING", "mode": "REQUIRED"},
        {"name": "status", "type": "STRING", "mode": "REQUIRED"},
        {"name": "user_id", "type": "STRING", "mode": "REQUIRED"},
        {"name": "created_date", "type": "TIMESTAMP", "mode": "REQUIRED"},
    ],
    "users": [
        {"name": "user_id", "type": "STRING", "mode": "REQUIRED"},
        {"name": "birth_year", "type": "INT64", "mode": "REQUIRED"},
        {"name": "country", "type": "STRING", "mode": "REQUIRED"},
        {"name": "city", "type": "STRING", "mode": "REQUIRED"},
        {"name": "created_date", "type": "TIMESTAMP", "mode": "REQUIRED"},
        {"name": "user_settings_crypto_unlocked", "type": "INT64", "mode": "REQUIRED"},
        {"name": "plan", "type": "STRING", "mode": "REQUIRED"},
        {"name": "attributes_notifications_marketing_push", "type": "INT64", "mode": "NULLABLE"},
        {"name": "attributes_notifications_marketing_email", "type": "INT64", "mode": "NULLABLE"},
        {"name": "num_contacts", "type": "INT64", "mode": "REQUIRED"},
        {"name": "num_referrals", "type": "INT64", "mode": "REQUIRED"},
        {"name": "num_successful_referrals", "type": "INT64", "mode": "REQUIRED"},
    ],
    "transactions": [
        {"name": "transaction_id", "type": "STRING", "mode": "REQUIRED"},
        {"name": "transactions_type", "type": "STRING", "mode": "REQUIRED"},
        {"name": "transactions_currency", "type": "STRING", "mode": "REQUIRED"},
        {"name": "amount_usd", "type": "FLOAT", "mode": "REQUIRED"},
        {"name": "transactions_state", "type": "STRING", "mode": "REQUIRED"},
        {"name": "ea_cardholderpresence", "type": "STRING", "mode": "NULLABLE"},
        {"name": "ea_merchant_mcc", "type": "FLOAT", "mode": "NULLABLE"},
        {"name": "ea_merchant_city", "type": "STRING", "mode": "NULLABLE"},
        {"name": "ea_merchant_country", "type": "STRING", "mode": "NULLABLE"},
        {"name": "direction", "type": "STRING", "mode": "REQUIRED"},
        {"name": "user_id", "type": "STRING", "mode": "REQUIRED"},
        {"name": "created_date", "type": "TIMESTAMP", "mode": "REQUIRED"},
    ],
}

if __name__ == "__main__":
    print((bigquery_schemas.keys()))
    print(len(bigquery_schemas.keys()))
