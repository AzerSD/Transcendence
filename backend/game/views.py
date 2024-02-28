from django.shortcuts import render
from .models import *

# Create your views here.

def lobby(request):
    return render(request, 'chat/lobby.html')