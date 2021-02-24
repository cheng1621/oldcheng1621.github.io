---
layout: post
title:  "C++ interview question"
date: 2021-01-30 16:08:10 +0800
categories: [C++]
tags: [interview questions]
---

1. define C++
> C++ is a programming language that is based on C language. 

2. Define Class in C++.
> user-defined data type. 

3. Object in C++.
>Object is an instance of the class.

4. Encapsulation in C++
>binding together the data and functions in a class. It is applied to prevent direct access to the data for security reasons. 

5. What is an abstraction in C++?
> it is hiding the internal implementations and displaying only the required details.

6. explain the concept of inheritance in C++
> C++ allows classes to inherit from other classes. including some used state and behavior.  

7. access specifier and its various types.
> 3 types: private , protected and public.
private means class members can't be accessed outside the class.
public: can be accessed outside the class, actually it can be accessed by the whole program.
protected is a little different, it can be accessed by the child class.

8. define a namespace.
> it is used for resolving the name conflict. 

9. define a class template.
> is a name given to the generic class.
`template <class T>`
```
class Stack {
    private:
        vector<T> elems.
}
```

10. Volatile.
> directs the compiler to change the variable externally.

11. Define storage class in C++?
> are you saying a class can store something, like variable. 

12. recursive inline function in c++. (I don't know much about this part.)
> copy something. it is possible to call an inline fuction from within itself in C++, the compiler may not generate the inline code. This is so because the compiler won't determine the depth of the recursion at the compile time.

13. Inline return-type function-name(parameters)
Inline int max(int a,int b){

}
inline is just a request, not a command.

14. `this`
> constant pointer. it holds the memory address of the current object.
Class Box
{
public:
    int a;
public: 
    bool compare(Box& box1){
        return this->a > box1.a;
    }
}

15. difference between C and c++
c++ supports references. 
there are some functions, like friend, inheritance.
c++ offers support for exception handling.

16. why do we need the `friend` class and function. 
> sometimes, there is a need for a class to access private members of a class.

Intermediate


# Operating System.
1. Process & thread.
process is an independent unit of resource allocating.  
thread is an independent unit of resource scheduling.

2. Communication between processes.
1. pipe. cache is really limited.
2. Semaphore. you can see it as a counter. it can be used to control the access to shared resources by multiple threads.  `Lock`.
3. signal. notify the destination process.
4. Message Queue.  a communication between applications.
5. Shared Memory.
6. Socket.

3. communication between threads.
1. mutes.
2. reader-writer lock
3. spin lock
4. condition. Semaphore.

4. synchronisation 
1. atomic operations.
2. semaphore.
3. read-write semaphore.
4. spinlock (a thread which tries to acquire it , the checking process is in the loop.)

big-endian: stores the most significant byte of a word at the smallest memory address.

little-endian: stores the least-significant byte at the smallest memory address.

# page replacement algorithm.
Operating system use pages for virtual memory management. decide which memory pages to page out, when a page of memory needs to be allocated.

FIFO, LRU.(least Recently Used)

# Operating System.
# concurrency and parallel
concurrency: two or more tasks can run in overlapping time periods.
parallelism: tasks literally run at the same time. e.g. on a multicore processor.

# shared memory. 
the resources can be accessed by many processes.
two type: exclusive sharing and simutaneous sharing.
printer. 

# virtual
two types: based on time or space.
multiple processes can run on a processor. 
in the memory management, we need to map the virtual address to physical address. 

# Asynchronous.
recover at another time.

# Some basic features.
## process management.
process control. process communication, process synchronization.

## memory management.
memory allocation. address mapping.

## File management.
directory management. Write/Read.

## device management.
I/O request.

# System call.
if a process in userspace want to use some functions in the kernal space, we have to use system call. (fork,exit(),wait,pipe(),open(),getpid.)

# kernel
you knwo, the kernel is really complex.
micro-kernel, we need to move some features outside the system. In that way, we could reduce the complexity of the whole system.
Since that code is running in the kernel. the basic code is in the userspace, we need to switch from user space to kernel space back and forth. the overhead of switching is really high.

# Process Management.
process: basic unit of resource allocation.
Thread: basic unit of independent scheduling.
thread does not own resource, thread can get access to the resource which belongs to the process.

# Process synchronization.
linearizability

# memory management.
virtual management. physical address is really limited.
MMU(memory management unit) page table

# device management.


# Linux
Summary: 
1. be familiar with some commands.
2. some principle about file system.
3. hard link and soft link.
4. process management.

# shortcut key.
Tab: complete file name.
Ctrl + C: make the program which in running stop.
Ctrl + D: EOF
--help: it's a help. how to use some function.
man: short for manual.
info: look over some document.
who: check if there are some users online.
sync: some data in memory would not be synchronized to disk immediately.
shutdown: shutdown the server or computer.
shutdown -k: notify all online users like, we are going to shutdown the computers.
shutdown -r: reboot the computer after shutdown all the service in the system.
shutdown -h: 
path: declare the path of the executable file, seperated by `:`.
sudo: Allow some users can use some functions resides in `root`. 

Package management tool:
RPM and DPKG.

vim: 
three modes: command mode, insert mode, bottom-line mode.
command mode, default mode.
insert mode:  press `i`.
Bottom-line mode: press ':'.

disk file name:
every hardware can be seen as a file.

# partition.
MBR partition and GPT partition.
MBR: Master boot record & partition table.

partition can be seen as file /dev/sda1.
`sector is the smallest storage unit of a disk`.


# when the computer is firstly booted.
BIOS: basic input/output system. It is used when booting the computer.
it is the first program when the computer is booted. 

# file system.
component: inode and block.
inode: a file takes an inode. the attribute of a file of the context of the file are recorded in inode.
block bitmap: check if the block is used or not.
superblock: record the whole information of the whole file system.

# read the file.
check inode and get the blocks where the file resides in. then get the context from the block.

one block can only be used by one file.
Directory: at least one inode or one block. 
/root: root directory
/user. the place where the software install.
/var. datafile is stored.
ls -- number of the links. size. time.


ls: list all the information of the files or directories.
cd: change the directory path.
mkdir: contruct a new directory.
rmdir: delete the directory.
touch: update the file time or construct a new file.
cp: make a copy of a file.
rm: delete the file.
mv: move the file
chmod: change the permissions.

# Link.
cat: get the context of a file.
tac: similar to cat. print the file from the last line to the first line.
more: check the file page by page.
less: similar to more.
head: get the first few lines.
tail: get the last few lines.
od: read the file in hexadecimal.
which -- search command.
whereis: similar to which.
locate: search file
find: find files.
gzip. compress

bash: one kind of shell. request kernel service.
echo: output the variable.

pipe command. `|`.
cut: cut the file into several pieces.
sort: sort the 
uniq: remove the duplicate date and make the data unique.
tee: double output.
tr: delete specific character in a line.

$ last | tr '[a-z]' '[A-Z]' change the character from lower case to upper case.

col: change `tab` to empty character.
expand: change tab to space.
join: combine the lines which have same data to one line.
paste: paste two lines together.
split: split one file into several files.

grep: $ grep -n 'the' regular_express.txt. 
get all words which is 'the' out.

printf: print the output in a special format.


# process management.
ps: the process information at a specific time.
top: print the process information every 2 seconds.
netstat: get the states of the network.

SIGCHLD
SIGCHLD: send SIGCHLD to the parent process when the child process terminated.

wait()
block the parent process when you are using wait. the process continue runing when the process receives SIGCHLD from the child process.
waitpid()



# 6.828 Operating System Engineering.

# lab1.
## Software Setup.
early PC. 16-bits Intel 8088 processor. capable of addressing 1MB of physical memory. starting at 0x00000000 and ending at 0x000FFFFF insteadof 0xFFFFFFFF.
the first 640KB area is marked 'low memory'. the reminder 384KB area is mainly used for BIOS.
BIOS is responsible for the system initialization.   (check amount of memory installed.) then load the operating system from some approprivate location. 

PC architects preserved the original layout for the low 1MB of the physical address.

#### boot loader.
A sector is the disk's minimum transfer granularity....
512 bytes boot sector.
two main features of the boot loader.
1. switches real mode to protected mode.
why protected mode? only in this mode, the software could access the memory above 1MB in the physical address.
2. the boot loader reads the kernel from the hard disk

0x7c00 where the boot sectore is loaded.

it will be loaded in physical memory at the 1MB point in the PC's RAM, just above the BIOS ROM.

#### Stack.
stack pointers(esp register) points to the lowest location on the stack that is currently in use.
pushing a value into the stack means decrease the stack pointer and writes value to the place where pointer points to.
poping a value from the stack means read the value from the place where stack pointer points to and increase the stack pointers.

`stack backtrack`: ebp is associated with the stack primarily by software convention. save the previous base pointer before pushing value into the stack.
like if an error occurs because of bad arguments passed to stack, we could back track to the original part.
eip value is the function's return instruction pointer.  

# lab2.
virtual address consists of a segment selector and an offset within the segment. A linear address is what you get after the segment translation but before page translation.

# lab3.
three environments: 
envs: all the environments in the array. 
curenv: current environment.
env_free_list: all inactive `Env` structure. allows easy allocation and deallocation of environments.

`Env` stucture: 
`env_tf` : holds the saved register value for the environment while the environment is not running. Like if switching from user space to kernel space, the system should save the register, and the environment could be resumed later.  
`env_link` : link to the next `Env` structure.  
`env_id` : unique identifiers the environment currently use the `Env` structure.  
`env_parent_id` : store the environment id who create this environment.  
`env_type` : distinguish special environment. usually is `Env_type_User`.
`env_status`: 5 types: `Env_free`, `env_runnable`, `env_running`, `env_not_runnable`, `env_dying`.
`Env_free`: the environment is inactive.
`env_runnable`: environment is waiting to run on the processor.  
`env_running` : the environment is running.
`env_not_runnable`: represents a currently active environment. like it is waiting for an interprocess communication from another environment.
`env_dying` : zombie environment.


`env_pgdir` : holds the kernel virtual address of this environment's page directory.  

`environment` could comples the concepts of `thread` and `address space`. thread is `env_tf` and `address space` was pointed to by env_pgdir.

there is only a single kernel stack in JOS.  

## basics of protected Control Transfer.
Exceptions and interrupts are both "protected control transfers", which can cause the processor to switch from user to kernel mode.

difference between `interrupt` and `exception`: 
interrupt: asynchronous event usually external to process while exception is synchronous like dividing by zero.

## interrupt descriptor table.
the processor can ensure the interrupt and exception can only cause kernel to be entered at a specific entries points.
maximum 256 entry point. (interrupt vector). set up by kernel.  

eip register: pointing to the kernel code designated to handle that type of exception.
cs register: the privilege level at which the exception handler is to run.  

### Task State Segment.
before the interrupt or exception occured, the original values of EIP and CS should be stored. In user mode.
Tss is to define the kernel stack that the processor should switch to when it transfers from user space to kernel mode.  

### nested exceptions and Interrupts.
cannot push its old state onto the kernel stack.  

### setting up the IDT.

## Part B.
`page fault exception.`

### system calls.
user processes ask the kernel to do things for them by invoking system calls.

accessing pages further down the stack

# lab4: Preemptive Multitasking.
a multiprocessor model have equivalent access to system resources such as memory and I/O buses. two processor: BSP and APs.

each CPU has an accompanying local APIC unit.(responsible for delivering interrupts throughout the system.) unique identifier when APIC connects to the CPU.  
CS:IP address where the AP should start running its entry code.
`MP configuration`.  

TSS is to specify where each CPU's kernel stack lives.
`lock` is to guarantee only one environment could use kernel code at the same time.  

### system calls for environment creation.
unix: fork copies the entire address space of calling process to create a new process. 

## lab B: copy-on-write fork.(user-level page fault handling.)
allow the parent and child to share the memory mapped into their respective address spaces until one of the processes actually modifies it. copy the mapping instead of the content.  

### user-level page fault handling
it's common to set up an address space so that page faults indicate when some action needs to take place.

##### page Fault Handler.

## part C:›



