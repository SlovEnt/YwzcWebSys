"""YwzcWebSys URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path

# 导入 xadmin，替换原始 admin
from django.views.static import serve
import commset
import xadmin
from django.views.generic import TemplateView
#
# from runscripts.views import GetTestRun

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('xadmin/', xadmin.site.urls),

    path('xadmin/insbusi/runscriptslist/', include('runscripts.urls')),


    # path('script/TestRun/', GetTestRun.as_vies(), name= "gettestrun")

]
