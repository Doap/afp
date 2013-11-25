# coding=utf-8
# Django settings for proyectomagazine project.
import os
import re

SITE_ROOT = os.path.abspath(os.path.dirname(__file__))

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ('Juan Carlos Alvarez', 'juan.alvarez@laprensa.com.ni'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'laprensa-test',
        'USER': 'juancarlos',
        'PASSWORD': 'fr1ck0ff',
        'HOST':'10.0.0.86',
        'PORT':'5432'
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'America/Managua'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'es-ni'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True

# If you set this to False, Django will not use timezone-aware datetimes.
USE_TZ = False

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = os.path.join(SITE_ROOT,'media')
# MEDIA_ROOT = '/var/www/html/magazine/' 
# MEDIA_ROOT = '/home/alvarezjuan/www/lppyapp/lpmagazine/proyectomagazine/proyectomagazine/media' 

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
# MEDIA_URL = '/media/'
MEDIA_URL = '/media/'

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
# STATIC_ROOT = os.path.join(SITE_ROOT,'static')
STATIC_ROOT = '/var/www/lp_django_apps/static_root/magazine'

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'dfjcim^dfucy%l_ddaj@sx640-=14mtla466@fekq3+q27((ke'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    # 'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # Agent Trust & One Time Pass
    # 'django_agent_trust.middleware.AgentMiddleware',
    # 'django_otp.middleware.OTPMiddleware',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'proyectomagazine.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'lpafp.wsgi.application'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'lpafp',
    'compressor',
    'storages',
)

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

TEMPLATE_CONTEXT_PROCESSORS = (
    # default template context processors
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',  
    'django.core.context_processors.static',
    'django.core.context_processors.request',
)

COMPRESS_ENABLED = True
COMPRESS_PRECOMPILERS = (
    ('text/less', 'lessc {infile} {outfile}'),
)
COMPRESS_CSS_FILTERS = (
    'compressor.filters.template.TemplateFilter',
    'compressor.filters.css_default.CssAbsoluteFilter'
    )
COMPRESS_TEMPLATE_FILTER_CONTEXT = {
    'STATIC_URL': STATIC_URL
}

# Amazon S3 Storages settings

DEFAULT_FILE_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
# STATICFILES_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
AWS_ACCESS_KEY_ID = 'AKIAJ77RGWPCVKJKKOVA'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 's3.laprensa.com.ni'
AWS_LOCATION = '/home/juancarlos/test/afp/'
AWS_S3_SECURE_URLS = False
AWS_QUERYSTRING_AUTH = False

EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'edicion.digital@laprensa.com.ni'
EMAIL_HOST_PASSWORD = 'B0l3tin2013*'
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'boletin@laprensa.com.ni'
# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'


try:
    from local_settings import *
except ImportError, e:
    pass
