#include<bits/stdc++.h>
using namespace std;
int main(){
	char alphabet[26] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};	
	cout<< "Enter the Caesar Ciphered Text: "<<endl;
	string s1;
	cin>>s1;
	cout<< "Enter the Orignal Text: "<<endl;
	string s2;
	cin>>s2;
	cout<<"The possible combinations I am trying are: "<<endl;
	
	int k=1;
	bool flag = false;
	for(int j=0;j<26;j++){
		for(int i=0;i<s1.size();i++){
			int index = s1[i] - 'a';
			s1[i] = alphabet[abs(index-k)%26];
		}
		cout<<s1<<endl;
		if(s1==s2){
			cout<<"THe orignal text was: "<<s1<<endl;
			flag = true;
			break;
		}
	}
	if(!flag){
		cout<<"Sorry Brother, the brute force is failed: "<<endl;
	}
	
	return 0;
}
