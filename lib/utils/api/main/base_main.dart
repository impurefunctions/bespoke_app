abstract class BaseAPIService{

  //GET: All Transactions
  Future<Map<String, dynamic>> getAllTransactions();

  // GET: Pending Transactions
  Future<Map<String, dynamic>> getPendingTransactions();

//GET: Failed Transactions
 Future<Map<String, dynamic>> getFailedTransactions();

//GET: Successful Transactions
  Future<Map<String, dynamic>> getSuccessfulTransactions();

  //GET: All Reversed Transactions
  Future<Map<String, dynamic>> getAllReversedTransactions();

  //GET: Pending Reversed Transactions
  Future<Map<String, dynamic>> getPendingReversedTransactions();

  //GET: Successful Reversed Transactions

  Future<Map<String, dynamic>> getSuccessfulReversedTransactions();

  //GET: Failed Reversed Transactions
  Future<Map<String, dynamic>> getFailedReversedTransactions();


  //POST: Create a new Transaction

  Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> body);

  //POST: Reverse a Transaction
  Future<Map<String, dynamic>> reverseTransaction(Map<String, dynamic> body);


}