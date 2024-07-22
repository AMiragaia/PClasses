import React, { useState } from 'react';
import { View, Text, Button, TextInput,Image,Pressable,TouchableOpacity } from 'react-native';
import { styles } from '../styles/AppStyles';
import logo from '../assets/logo.png';


export default function LoginScreen({ navigation }) {
    const [identifier, setIdentifier] = useState('');
    const [password, setPassword] = useState('');
  
    
    function authenticate() {
      if ((identifier === 'admin'|| identifier === '960000000') && password === '123' || (identifier === 'MarcoSilva@ua.pt' || identifier ==='961111111') && password === '1' ) {
        navigation.replace('Home');
      } else {
        alert('Incorrect email or password.');
      }
      
    }

    function register() {
      // Navegue para a tela de registro ou faça algo quando o botão de registro for pressionado
      navigation.replace('Register');
    }
  
    return (
      <View style={styles.container}>
        <Image source={logo} style={styles.logo} />
        
        <TextInput
          style={styles.input}
          placeholder="Email or phone number"
          value={identifier}
          onChangeText={setIdentifier}
        />
        <TextInput
          style={styles.input}
          placeholder="Password"
          value={password}
          onChangeText={setPassword}
          secureTextEntry={true}
        />
        <TouchableOpacity onPress={authenticate} style={styles.button}>
          <Text style={styles.buttonText}>Sign In</Text>
        </TouchableOpacity>
        

        <Pressable onPress={register} style={styles.button1}>
          <Text style={styles.buttonText1}>Do you have Account? Register</Text>
        </Pressable>
        

       
      </View>
    );
  
}
