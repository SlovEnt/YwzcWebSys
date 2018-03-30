from django.shortcuts import render

# Create your views here.



from django.views.decorators.csrf import csrf_exempt, requires_csrf_token
from django.views.generic import View
from django.http import HttpResponse

class GetTestRun(View):
    @csrf_exempt
    def post(self,request):
        print("11111")
        print(request)
        return HttpResponse("注册成功")


class GetTestRun2(View):
    @csrf_exempt
    def post(self,request):
        print("Test_Run_Script Test_Run_Script Test_Run_Script")
        print(request)
        return HttpResponse("注册成功")
