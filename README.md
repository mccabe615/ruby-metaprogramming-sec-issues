META-PROGRAMMING TALK
===============================

* Intro (15 min)
  * What is Ruby?
  * What is Metaprogramming
* Metaprogramming Overview
  * Why it's cool
  * Examples of Metaprogramming solving problems
  * Why it's better than traditional methods of acheiving goals
  * Simple Code Examples
  * Gems/Examples in Rails that use Metaprogramming that you may not realize
* Bad Meta Programming
  * As you can see...
    * Metaprogramming is awesome
    * You can probably imagine some nefarious scenarios
  * 3 Deadly Sin Functions
    * send() with a section on fixing
    * constantize() with a section on fixing
    * eval() with a section on fixing
    * IN all examples be sure to include an example function, what it does, and why it's bad news
* Disclaimer
  * not dogging on Rails or Ruby, but because it's so versatile/powerful, need to be careful
  * Open for Questions
  * Thanks and Close

*Open Source Gems with Meta-programming Issues
   *Diaspora (constantize)
   *Discourse (send)
   *Fat Free CRM (constantize)
   *Redmine (const_get)
   *Spree (send, constantize)
