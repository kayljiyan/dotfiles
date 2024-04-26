import os
from supabase import create_client, Client

class Supabase():
    def client(url, key):
        global supabase
        supabase = create_client(url, key)
    def signIn(email, password):
        supabase.auth.sign_in_with_password({"email": f"{email}", "password": f"{password}"})
        data = supabase.auth.get_user().user.id
        return data

class TestClass():
    def hello():
        return "Hello! I'm from a Python script."
    def add(x, y):
        return x+y
    def user(name, age, address):
        return f"Hi {name}! I see you are {age} years old and you live in {address}. Nice to meet you!"
