---
layout: post
title:  "Word Search"
date: 2021-12-15 8:10:10 +0800
categories: [word search]
tags: [leetcode]
---
![graph](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/wordSearchGraph.png){: width="400" height="400" .normal}
# Note.
1. **board** only contains lower-case letter.  
2. every string in **words** is unique.  

# Solution 1 ---> DFS
```
class solution1 {
public:
    vector<string> findwords(vector<vector<char> >& board,vector<string>& words){
        vector<string> ans;
        int n = words.size();
        // search word one by one.
        for (int i = 0;i < n;i++){
            if (search(board,words[i])) ans.push_back(words[i]);
        }
        return ans;
    }
    bool search(vector<vector<char> > &board, string &word){
        if (word == "") return true;
        int m = board.size();
        int n = board[0].size();
        for (int i = 0;i < m;i++){
            for (int j = 0;j < n;j++){
                if (board[i][j] == word[0]){
                    if (dfs(board,word,0,i,j)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    bool dfs(vector<vector<char> > &board, string &word,int start,int x,int y){
        if (start >= word.size()) return true;
        int m = board.size();
        int n = board[0].size();
        if (x >= m || x < 0 || y >= n || y < 0) return false;
        if (board[x][y] != word[start]) return false;
        char cur = board[x][y];
        board[x][y] = '#';
        bool found = dfs(board,word,start + 1,x + 1,y) || \
                    dfs(board,word,start + 1,x - 1,y) || \
                    dfs(board,word,start + 1,x,y + 1) || \
                    dfs(board,word,start + 1,x,y - 1) || \
                    dfs(board,word,start + 1,x + 1,y + 1) || \
                    dfs(board,word,start + 1,x + 1,y - 1) || \
                    dfs(board,word,start + 1,x - 1,y + 1) || \
                    dfs(board,word,start + 1,x - 1,y - 1);
        board[x][y] = cur;
        return found? true: false;
    }
};
```
#### complexity
***time complexity*** : O(k * (m * n * 8 ^ l))  
***space complexity*** : O(k)  



# Solution 2. ---> Trie
#### TrieNode
```
struct TrieNode {
    TrieNode *next[26];
    string *word;
};
```
#### TrieTree
```
class TrieTree {
public:
    TrieNode *root;
public:
    TrieTree() {root = new TrieNode();}
    void insert(string& s) {
        TrieNode *head = root;
        int n = s.size();
        for (int i = 0;i < n;i++){
            int num = s[i] - 'a';
            if (!head->next[num]) head->next[num] = new TrieNode();
            head = head->next[num];
        }
        head->word = new string(s);
    }
    vector<string> search(vector<vector<char>>& board) {
        vector<string> ans;
        TrieNode * head = root;
        int m = board.size();
        int n = board[0].size();
        for (int i = 0;i < m;i++){
            for (int j = 0;j < n;j++){
                dfs(board,i,j,ans,head);
            }
        }
        return ans;
    }
    void dfs(vector<vector<char>>& board,int x,int y,vector<string>& ans,TrieNode *node){
        int m = board.size();
        int n = board[0].size();
        if (x < 0 || x >= m || y < 0 || y >= n || board[x][y] == '#') return;
        TrieNode *next = node->next[board[x][y] - 'a'];
        if (!next) return;
        if (next->word) ans.push_back(*(next->word));
        char cur = board[x][y];
        board[x][y] = '#';
        dfs(board,x + 1,y,ans,next);
        dfs(board,x - 1,y,ans,next);
        dfs(board,x,y + 1,ans,next);
        dfs(board,x,y - 1,ans,next);
        dfs(board,x - 1,y - 1,ans,next);
        dfs(board,x - 1,y + 1,ans,next);
        dfs(board,x + 1,y - 1,ans,next);
        dfs(board,x + 1,y + 1,ans,next);
        board[x][y] = cur;
    }
};
```
#### solution
```
class solution2 {
private:
    TrieTree *root;
public:
    solution2() {root = new TrieTree();}
public:
    void constructTree(vector<string>& words){
        int n = words.size();
        for (int i = 0;i < n;i++){
            root->insert(words[i]);
        }
    }
    vector<string> findwords(vector<vector<char> >& board,vector<string>& words){
        constructTree(words);
        vector<string> ans = root->search(board);
        removeduplicate(ans);
        return ans;
    }
    void removeduplicate(vector<string>& ans){
        sort( ans.begin(), ans.end() );
        ans.erase( unique( ans.begin(), ans.end() ), ans.end() );
    }
};
```

#### note.
> clients send an array of words. (the words should have the same prefix, like "ab","abcd","abcde")  

### advantage.
> search words as a whole.  

#### Complexity.
time : O(m * n * 8 ^ l)  
space : O(size of trieTree).

# Solution 3. ---> need to be discussed.
![WordSearchGraph](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/wordSearchGraph.png){: width="300" height="300" .left}
![WordSearchTrieTree](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/wordSearchTrieTree.png){: width="410" height="300" .right}


#### note.
1. client send one word at a time.  

#### example. words["armt", "asl"]

> words = 'a', 'r', 'm' ,'t'. 

#### TrieNode
```
struct TrieNode {
    vector<vector<TrieNode *>> next;
    string *word;
    TrieNode():next(26){}
};
```

#### TrieTree
```
class TrieTree{
private:
    TrieNode *root;
    vector<int> dirs;
private:
    void insert(vector<vector<char>>& board,int x,int y,vector<vector<TrieNode *>>& visited){
        TrieNode *head = root;
        int index = board[x][y] - 'a';
        int m = board.size();
        int n = board[0].size();
        if (!visited[x][y]) {
            TrieNode* newNode = new TrieNode();
            head->next[index].push_back(newNode);
            visited[x][y] = newNode;
        } else {
            TrieNode *node = visited[x][y];
            head->next[index].push_back(node);
        }
        head = head->next[index][head->next[index].size() - 1];
        for (int i = 0;i < dirs.size() - 1;i++){
            int temp_x = x + dirs[i];
            int temp_y = y + dirs[i + 1];
            if (temp_x < 0 || temp_x >= m || temp_y < 0 || temp_y >= n) continue;
            int cur = board[temp_x][temp_y] - 'a';
            if (!visited[temp_x][temp_y]) {
                TrieNode *nNode = new TrieNode();
                head->next[cur].push_back(nNode);
                visited[temp_x][temp_y] = nNode;
            } else {
                TrieNode *node = visited[temp_x][temp_y];
                head->next[cur].push_back(node);
            }
        }

    }
public:
    TrieTree() {
        root = new TrieNode();
        dirs = {-1,0,1,0,-1,1,1,-1,-1};
    };
    void handle(vector<vector<char>>& board){
        int m = board.size();
        int n = board[0].size();
        vector<vector<TrieNode *>> visited(m,vector<TrieNode *>(n,NULL));
        for (int i = 0;i < m;i++){
            for (int j = 0;j < n;j++){
                insert(board,i,j,visited);
            }
        }
    }
    bool search(string &word){
        int n = word.size();
        int start = 0;
        TrieNode* head = root;
        unordered_set<TrieNode *> s;
        return dfs(word,start,head,s);
    }
    bool dfs(string& word,int start,TrieNode* head,unordered_set<TrieNode *>& trieSet){
        if (start >= word.size()) return true;
        int index = word[start] - 'a';
        if (head->next[index].empty()) return false;
        vector<TrieNode *> candidates = head->next[index];
        for (int i = 0;i < candidates.size();i++){
            if (trieSet.find(candidates[i]) != trieSet.end()) continue;
            trieSet.insert(candidates[i]);
            if (dfs(word,start + 1,candidates[i],trieSet)) return true;
            trieSet.erase(candidates[i]);
        }
        return false;
    }
};
```

#### solution.
```
class Solution3 {
public:
    vector<string> findwords(vector<vector<char>>& board, vector<string>& words) {
        vector<string> ans;
        TrieTree *root = new TrieTree();
        root->handle(board);
        for (int i = 0;i < words.size();i++){
            if(root->search(words[i])) ans.push_back(words[i]);
        }
        return ans;
    }
};
```

#### Complexity.
time : O(k * (m * n / 26 * l))
space: O(m * n)
#### advantage 
low-latency. (search the word one by one).

#### disadvantage.
if the application doesn't care about the latency. solution 2 may be the best.  
