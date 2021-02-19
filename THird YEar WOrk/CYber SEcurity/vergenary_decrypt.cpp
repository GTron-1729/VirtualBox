#include<bits/stdc++.h>
using namespace std;
int main(){
	char alphabet[26] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};	
	cout<< "Enter the Vergenary Ciphered Text: "<<endl;
	string s;
	cin>>s;
	cout<< "Enter the key array: "<<endl;
	int arr[s.size()];
	for(int i=0;i<s.size();i++){
		cin>>arr[i];
	}
	int k=0;
	for(int i=0;i<s.size();i++){
		int index = s[i] - 'a';
		s[i] = alphabet[abs(index-arr[k])%26];
		k++;
	}
	cout<<"THe decrypted text is: "<< s<<endl;
	
	return 0;
}
