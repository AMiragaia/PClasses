def reverse(s):
   return s  if len(s) <=1 else s[-1:]+ reverse(s[:-1])
   

# These tests should pass!
assert reverse("hello") == "olleh"
assert reverse("follow") == "wollof"
assert reverse("x") == "x"
assert reverse("") == ""
