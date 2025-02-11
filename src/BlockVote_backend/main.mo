import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Trie "mo:base/Trie";
import HashMap "mo:base/HashMap";
// import Iter "mo:base/iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
// import Types "types";

type Role = {
    #Voter;
    #Admin;
};

type User = {
    phone: Text;
    password: Text;
    role: Role;
};

type Candidate = {
    id: Nat;
    name: Text;
    votes: Nat;
};

type Poll = {
    id: Nat;
    title: Text;
    description: Text;
    candidates: [Candidate];
    isActive: Bool;
};

actor {

    stable var users = Trie<Text, User>(); // phone -> User
    stable var polls = HashMap.HashMap<Nat, Poll>(10, Nat.hash, Nat.equal);    // pollId -> Poll
    stable var nextPollId : Nat = 1;
    stable var nextCandidateId : Nat = 1;
    
    // --- User Authentication ---
    public shared func registerVoter(phone: Text, password: Text) : async Text {
        if (users.get(phone) != null) {
        return "User already registered.";
        };
        users.put(phone, { phone = phone; password = password; role = #Voter });
        return "Voter registered successfully.";
    };
    
    // public shared func login(phone: Text, password: Text) : async ?Role {
    //     switch (users.get(phone)) {
    //     case (?user) {
    //         if (user.password == password) {
    //         return ?user.role;
    //         } else {
    //         return null; // Invalid password
    //         };
    //     };
    //     case (null) return null; // User not found
    //     };
    // };
    
    // // --- Admin Functions ---
    // public shared func registerAdmin(phone: Text, password: Text) : async Text {
    //     if (users.containsKey(phone)) {
    //     return "Admin already registered.";
    //     };
    //     users.put(phone, { phone = phone; password = password; role = #Admin });
    //     return "Admin registered successfully.";
    // };
    
    // private func isAdmin(phone: Text) : Bool {
    //     switch (users.get(phone)) {
    //     case (?user) user.role == #Admin;
    //     case (null) false;
    //     };
    // };
    
    // // --- Poll Functions ---
    // public shared func createPoll(title: Text, description: Text, candidates: [Text]) : async Text {
    //     let phone = Principal.current().toText();
    //     if (not isAdmin(phone)) {
    //     return "Only admins can create polls.";
    //     };
    //     let pollId = nextPollId;
    //     nextPollId += 1;
    //     let candidateList = candidates.map((name) => {
    //     let candidateId = nextCandidateId;
    //     nextCandidateId += 1;
    //     return { id = candidateId; name = name; votes = 0 };
    //     });
    //     polls.put(pollId, { id = pollId; title = title; description = description; candidates = candidateList; isActive = true });
    //     return "Poll created successfully.";
    // };
}