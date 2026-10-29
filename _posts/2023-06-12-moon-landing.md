---
title: Experiment Deep Q-Learning with Gymnasium Lunar Lander
description: >-
  Landing a lunar shuttle in simulated environment using reinforcement learning
author: khang
date: 2023-06-12
categories: [Engineering] # Maximum 2 entries
tags: [reinforcement learning]
media_subpath: /assets/img/moon-landing
image:
  path: environment.jpg
  alt: Simulated environment
  lqip: lqip/environment.jpg
---

This was my first attempt to learn reinforcement learning. The agent was trained to land a space shuttle in a randomly generated environment.

I started by learning Q-Learning through a project on solving Blackjack. However, because of the finite dimension limitation, I decided to use Deep Q-Learning, which combined the original method with a neural network. This approach showed promising results.

{% include img-row.html
  per_row=2
  src_1='reward.jpg' alt_1='Episode rewards'
  src_2='duration.jpg' alt_2='Episode durations'
%}

As shown above, after about 200 episodes, the agent learned how to land the shuttle reliably. Additionally, since I added the punishment for using too much fuel, the agent also learned to land the shuttle more confidently (200 frames vs. 900 frames).

For this project, I had to learn how to use PyTorch and implement different reinforcement learning algorithms in two weeks.
