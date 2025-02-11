import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";

actor BlockVote {
    type Voter = {
        id : Text;
        hasVoted : Bool;
    };

    type Candidate = {
        name : Text;
        votes : Nat;
    };

    // Use stable maps for persistence across upgrades
    stable var voters = HashMap.HashMap<Text, Voter>(10, Text.equal, Text.hash);
    stable var candidates = HashMap.HashMap<Text, Candidate>(10, Text.equal, Text.hash);

    public func registerCandidate(name: Text) : async Text {
        if (candidates.containsKey(name)) {
            return "Candidate already registered.";
        } else {
            candidates.put(name, { name = name; votes = 0 });
            return "Candidate registered successfully.";
        }
    };

    public func registerVoter(id: Text) : async Text {
        if (voters.containsKey(id)) {
            return "Voter already registered.";
        } else {
            voters.put(id, { id = id; hasVoted = false });
            return "Voter registered successfully.";
        }
    };

    public func vote(voterId: Text, candidateName: Text) : async Text {
        switch (voters.get(voterId)) {
            case (null) { return "Voter not registered."; };
            case (?voter) {

                if (voter.hasVoted) {
                    return "Voter has already voted.";
                }
        
                switch (candidates.get(candidateName)) {
                    case (null) { return "Candidate not found."; };
                    case (?candidate) {
                        // More idiomatic way to update the vote count:
                        candidates.put(candidateName, { ...candidate, votes = candidate.votes + 1 }); // Spread operator for cleaner update
        
                        voters.put(voterId, { ...voter, hasVoted = true }); // Spread operator
        
                        return "Vote cast successfully.";
                    }
                }
            }
        }
    public query func getResults() : async [(Text, Nat)] {
        // More efficient way to convert HashMap to array:
        candidates.entries().map<(Text, Candidate), (Text, Nat)>(func(entry) {
            let (name, candidate) = entry; // Destructuring for clarity
            return (name, candidate.votes);
        })
    };
};