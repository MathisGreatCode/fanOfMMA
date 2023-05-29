from django import forms
from .models import Publication, Profile, Fighter, Organization, Prediction,  Fight, Event
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from datetime import datetime

class PubliForm(forms.ModelForm):
    body = forms.CharField(required=True,
                           widget=forms.widgets.Textarea(attrs={"placeholder": "Share your thoughts !", "class":"form-control", "style":"background-color: #FFF8CD"}), 
                           label="",)
    class Meta:
        model = Publication
        exclude = ("user",)

class SignUpForm(UserCreationForm):
    email = forms.EmailField(label="", widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'Email Address'}))
    favorite_org = forms.ModelChoiceField(queryset=Organization.objects.all(), to_field_name="name", widget=forms.Select(attrs={'class':'form-control', 'placeholder':'Favorite Organization'}))
    favorite_fighter = forms.ModelChoiceField(queryset=Fighter.objects.all(), to_field_name="name", widget=forms.Select(attrs={'class':'form-control', 'placeholder':'Favorite Fighter'}))
    class Meta:
       model= User
       fields = ('username', 'email', 'password1', 'password2', 'favorite_org', 'favorite_fighter' )

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['username'].widget.attrs['placeholder'] = 'User Name'
        self.fields['username'].label = ''
        self.fields['username'].help_text = '<span class="form-text text-muted"><small>Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.</small></span>'

        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['placeholder'] = 'Password'
        self.fields['password1'].label = ''
        self.fields['password1'].help_text = '<ul class="form-text text-muted small"><li>Your password can\'t be too similar to your other personal information.</li><li>Your password must contain at least 8 characters.</li><li>Your password can\'t be a commonly used password.</li><li>Your password can\'t be entirely numeric.</li></ul>'

        self.fields['password2'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['placeholder'] = 'Confirm Password'
        self.fields['password2'].label = ''
        self.fields['password2'].help_text = '<span class="form-text text-muted"><small>Enter the same password as before, for verification.</small></span>'

class PredictionForm(forms.ModelForm):
    fight = forms.ModelChoiceField(queryset=Fight.objects.filter(event__date_time__gte=datetime.now()), widget=forms.Select(attrs={'class':'form-control', 'placeholder':'Choose a fight'}))
    winner = forms.ChoiceField(choices=((1, 'Fighter 1'), (2, 'Fighter 2')), widget=forms.RadioSelect)
    class Meta:
        model = Prediction
        fields = ['fight', 'winner']