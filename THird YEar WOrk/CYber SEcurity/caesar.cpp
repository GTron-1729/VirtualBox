#include<bits/stdc++.h>
using namespace std;
int main(){
	char alphabet[26] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};	
	cout<< "Enter the Plain Text: "<<endl;
	string s;
	cin>>s;
	int key = 3;
	for(int i=0;i<s.size();i++){
		int index = s[i] - 'a';
		s[i] = alphabet[(index + key)%26];
	}	
	cout<<"THe Caesar Ciphered text is: "<<s<<endl;
	return 0;
}
