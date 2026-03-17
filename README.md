<a id="permalink"></a>
# Why we made this

Passover is one of my favorite holidays, and I love hosting Seders. My wife was not raised Jewish, and we quickly realized that existing Haggadot had some substantial drawbacks for how we wanted to celebrate Passover.

Some of the problems we ran into were:

1. Haggadot labeled for "interfaith families" were often abridged and skipped meaningful prayers and rituals of the Seder.
2. The way Hebrew is usually transliterated is not immediately intuitive to English speakers with no experience with Hebrew.
3. There are a surprising number of cases in Jewish songs and prayers where we repeat a line, but there's no indication of that at all in the text (which is very jarring for someone trying to join in).
4. Some Haggadot did meet some of these criteria, but were all substantially different from each other in the way they observed the rituals. We wanted to have consistency within the rituals, but not be reading the _exact_ text verbatim every single year.

To solve this, we created our own Haggadah template that includes variations on the theme of freedom with readings at each of the four cups of wine.  So far, we've written five different versions. If you notice any errors or would like to contribute additional themes, please see the [Development](#development) section for more details.


# How can I download the Haggadot?

Download the latest versions of the PDF files from the [Releases page](../../releases).

# What are the different themes of the Haggadot?

These Haggadot follow the same Seder structure, but each includes different readings around the four cups of wine to explore a different aspect of freedom, much like Shabbat services follow the same rituals each week, but reflect on a different Torah portion to add variety to the celebration.  More details on the [theme descriptions](./wine-themes/README.md) page.


# FAQs

<details>
<summary><strong>How long are these Haggadot?</strong></summary>

There's some variation in the length of the readings in the different themes, but typically the Seder takes around 30-45 minutes before the meal, and 20-30 minutes afterward (also dependent on how many Hallel songs you choose to sing).

</details>

<details>
<summary><strong>Why is the transliteration different than in other Haggadot?</strong></summary>

These Haggadot are designed to be extra friendly to people at the seder (guests or family members) who did not grow up Jewish. The transliterations are more easily readable for English speakers who have never encountered Hebrew before...apart from still using 'ch' for the chet/chof sound (I don't know what else to use for that...there's no equivalent in English).

</details>

<details>
<summary><strong>Why does it just say "Tell Passover Story" instead of having readings for the story?</strong></summary>

I've found it useful to be able to "read the room" during the Seder, especially regarding the current attention span of smaller children that may be present, and adjust the language and level of detail in the retelling of the story accordingly. If you want a standard reading for the story of passover, there are many sources you could get examples from to include in your Seder.

</details>

<details>
<summary><strong>Why is the Hallel a separate document from the rest of the Haggadah?</strong></summary>

The Hallel stays the same every year, while the themes for the cups of wine change. We've attempted to include it all as a single packet at past Seders if we want to just reuse the whole theme for a future Seder, but (at least at our Seders) the main content of the Haggadah tends to get lots of spills, tears, and other damage. This doesn't seem to happen with a separate set of pages for the Hallel. People also often have their own favorite Hallel songs that they want to include, so keeping it separate allows easy flexibility for that.

</details>

<details>
<summary><strong>What do the action symbols in the Haggadah mean?</strong></summary>

Two symbols appear throughout the Haggadah to help guide participants:

- 📖 **(book icon)** — Marks a **reading passage**. The leader (or someone designated) reads this text aloud to the group.
- 👉 **(pointing hand icon)** — Marks a **seder action** — something that participants should physically do (e.g., "Fill cup with wine", "Wash hands", "Eat the karpas"), and not read aloud. These are typically underlined in the printed document as well.

</details>

<details>
<summary><strong>What is the 'egg cracking tournament' referenced during the festive meal?</strong></summary>

As Passover typically occurs very close to NCAA "March Madness", we've created our own tradition out of the hard-boiled egg on the Seder plate. Each participant in the Seder takes a hard-boiled egg and breaks off into pairs. On the count of three, they tap their eggs together until one cracks. The unbroken eggs then proceed to the next "round" until the Champion is crowned. Everyone else can eat their eggs while the Champion gets to be first in line for food.

(This is, of course, optional to include in your Seder)

</details>

<details>
<summary><strong>Are there any restrictions on using this?</strong></summary>

None! All the Haggadot are completely free to distribute and use as you wish.

If you want to share the overall project with people, here's some example text:

> We struggled to find Haggadot which were accessible to people who were not raised Jewish, a complete version of the Jewish experience, and struck a balance of consistent traditions year-to-year while not being the exact same text. Over the years we wrote our own Haggadot to solve this. We finally collated them all together [here](https://github.com/ejfine/haggadot?tab=readme-ov-file#permalink) if you're interested.

</details>

# Development

[![Actions status](https://github.com/ejfine/haggadot/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/ejfine/haggadot/actions)
[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/ejfine/haggadot)
[![OpenIssues](https://isitmaintained.com/badge/open/ejfine/haggadot.svg)](https://isitmaintained.com/project/ejfine/haggadot)

To compile the Haggadah locally, run:

```bash
./compile.sh
```