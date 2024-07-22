import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import LoginScreen from '../screens/LoginScreen'; // Make sure you have the correct path
import HomeScreen from '../screens/HomeScreen';
import ResultsScreen from '../screens/ResultsScreen';
import TripDetailScreen from '../screens/TripDetailScreen';
import AccountScreen from '../screens/AccountScreen';
import TripsScreen from '../screens/TripsScreen';
import RegisterScreen from '../screens/RegisterScreen';
import CarrosScreen from '../screens/CarrosScreen';
import HistoricoScreen from '../screens/HistoricoScreen';
import ContaScreen from '../screens/ContaScreen';
import SobreTiScreen from '../screens/SobreTiScreen';
import { Ionicons } from '@expo/vector-icons';
import Search from '../screens/Search';
import Origin from '../screens/Origin';
import Destination from '../screens/Destination';
import Itenerary from '../screens/Itenerary';
import ChooseDay from '../screens/ChooseDay';
import ReservationScreen from '../screens/ReservationScreen'; 
import AddRideScreen from '../screens/AddRideScreen';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

function HomeTabs() {
  return (
    <Tab.Navigator screenOptions={({ route }) => ({
      tabBarIcon: ({ focused, color, size }) => {
        let iconName;
        if (route.name === 'Home') {
          iconName = focused ? 'home' : 'home-outline';
        } else if (route.name === 'Trips') {
          iconName = focused ? 'list' : 'list-outline';
        } else if (route.name === 'Account') {
          iconName = focused ? 'person' : 'person-outline';
        }
        return <Ionicons name={iconName} size={size} color={color} />;
      },
      tabBarActiveTintColor: 'tomato',
      tabBarInactiveTintColor: 'gray',
    })}>
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="Trips" component={TripsScreen} />
      <Tab.Screen name="Account" component={AccountScreen} />
    </Tab.Navigator>
  );
}

export default function AppNavigation() {
  return (
    <Stack.Navigator initialRouteName="Login" screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Register" component={RegisterScreen} />
      <Stack.Screen name="Login" component={LoginScreen} />
      <Stack.Screen name="Home" component={HomeTabs} />
      <Stack.Screen name = "Search" component={Search} options={{headerShown : true}}/>
      <Stack.Screen name="Origin" component={Origin} />
      <Stack.Screen name="Destination" component={Destination} />
      <Stack.Screen name="Itenerary" component={Itenerary} />
      <Stack.Screen name="ChooseDay" component={ChooseDay} />
      <Stack.Screen name="AddRideScreen" component={AddRideScreen} />
      <Stack.Screen name="Carros" component={CarrosScreen} />
      <Stack.Screen name="Historico" component={HistoricoScreen} />
      <Stack.Screen name="Conta" component={ContaScreen} />
      <Stack.Screen name="SobreTi" component={SobreTiScreen} />
      <Stack.Screen name="Results" component={ResultsScreen} options={{ headerShown: true }} />
      <Stack.Screen name="TripDetail" component={TripDetailScreen} options={{ headerShown: true }} />
      <Stack.Screen name="Reservation" component={ReservationScreen} options={{ headerShown: true }} />
    </Stack.Navigator>
  );
}
