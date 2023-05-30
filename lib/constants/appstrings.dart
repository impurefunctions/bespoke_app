const String baseURLAuth = '/api/v1/auth';
const String baseUrlMain = '/api/v1';
const String baseURL = 'http://linklify.me';
const String loginAPI = '$baseURLAuth/login'; //TODO: Add login API
const String getUserAPI = '$baseURLAuth/user'; //TODO: Add get user API
const String logoutAPI = '$baseURLAuth/logout'; //TODO: Add update user API
const String sendOTPAPI = '$baseURLAuth/send-otp'; //TODO: Send OTP API
const String verifyOTPAPI  = '$baseURLAuth/reset-password'; //TODO: Reset Password API


const String invalidEmail = 'Invalid email';
const String invalidPassword = 'Invalid password';
const String invalidOTP = 'Invalid OTP';
const String invalidOmang = 'Invalid Omang';
const String invalidPhone = 'Invalid Phone Number';
const String cannotBeEmpty = 'Cannot be empty';
const String invalidName = 'Invalid Name';
const String fieldRequired = 'Field is required';

//Transactions

const String allTransactionsAPI = '$baseURLAuth/transactions';
const String pendingTransactionsAPI = '$baseURLAuth/transactions/?status="pending"';
const String failedTransactionsAPI = '$baseURLAuth/transactions/?status="failed"';
const String successfulTransactionsAPI = '$baseURLAuth/transactions/?status="success"';
const String createTransactionAPI = '$baseURLAuth/transactions/create';



//Reversed Transactions
const String allReversedTransactionsAPI = '$baseURLAuth/transactions/reversals';
const String pendingReversedTransactionsAPI = '$baseURLAuth/transactions/reversals/?status="pending"';
const String failedReversedTransactionsAPI = '$baseURLAuth/transactions/reversals/?status="failed"';
const String successfulReversedTransactionsAPI = '$baseURLAuth/transactions/reversals/?status="success"';
const String reverseTransactionAPI = '$baseURLAuth/transactions/reverse/';


