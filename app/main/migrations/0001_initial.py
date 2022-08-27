# Generated by Django 3.2 on 2022-02-04 11:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SiteSetting',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('school_name', models.CharField(max_length=150, verbose_name='نام مدرسه')),
                ('school_logo', models.ImageField(upload_to='main/school_logo/', verbose_name='لوگو مدرسه')),
                ('site_color', models.CharField(choices=[('green', 'سبز'), ('orange', 'نارنجی'), ('yellow', 'زرد')], default='green', max_length=10, verbose_name='رنگ سایت')),
                ('site_menu_theme', models.CharField(choices=[('waterfall', 'منو آبشاری'), ('four_rooms', 'منو چارخونه ای')], default='waterfall', max_length=30, verbose_name='تم منو سایت')),
                ('favicon', models.ImageField(blank=True, null=True, upload_to='main/school_logo/', verbose_name='فاآیکون')),
            ],
            options={
                'verbose_name': 'تنظیمات سایت',
                'verbose_name_plural': '01. تنظیمات سایت',
            },
        ),
    ]