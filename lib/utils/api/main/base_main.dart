abstract class BaseAPIService{

  //GET: All Transactions
  Future<Map<String, dynamic>> getAllTransactions();

  //POST: Create a new Transaction

  Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> body);

}