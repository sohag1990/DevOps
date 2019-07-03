# Hola :-)

#MongoDB commands
#to connect mongo server
mongo --host 172.17.0.3 
 # to list database
db.adminCommand( { listDatabases: 1 } )
# to select database mongoChat
use mongochat 
# to show the available tables
db.runCommand( { listCollections: 1.0, authorizedCollections: true, nameOnly: true } ) 
## to fetch data from a collection
#to show all chat data entry from chat collection/table
db.chats.find().pretty(); 
# find by name "Joe"
db.chats.find( { name: "Joe" } ); 
## delete entry
db.chats.deleteOne( { "_id" : ObjectId("563237a41a4d68582c2509da") } );
db.chats.deleteMany( { "name" : "Joe" } );
## insert entry
db.chats.insertOne( { name: "John", message: "Hola" } );
db.chats.insertMany( [
      { name: "Doe", message: "Hi" },
      { name: "John", message: "There" },
      { name: "Joe" , message: "Hola" }
   ] );
## Update entry
db.chats.updateOne(
      { "name" : "Dev" },
      { $set: { "message" : "!!!Boom!!!" } }
   );
db.chats.updateMany(
      { count: { $gt: 4 } },
      { $set: { "Review" : true } }
   );   
   
# to show all collections
db.getCollectionInfos();
# truncate chats collection
db.chats.remove({}) 

## mongodb backup and restore
#Export
mongoexport -h 172.17.0.3 -d mongochat -c mongochat -o ~/backup/mongobak-30-march/mongochat.json
# Import/Restore:
mongoimport -h 172.17.0.3 -d mongochat -c mongochat ~/backup/mongobak-30-march/mongochat.json