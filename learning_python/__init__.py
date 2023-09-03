def main():
  print("Hello, world!")

def sieve(max_prime):
    s = [True] * max_prime
    for i in range(2, max_prime):
        if s[i]:
            print(i)
            for j in range(i * i, max_prime, i):
                s[j] = False