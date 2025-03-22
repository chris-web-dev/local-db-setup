db = db.getSiblingDB("devmongo");

db.users.insertMany([
 { username: "alice", email: "alice@example.com" },
 { username: "bob", email: "bob@example.com" },
]);
