<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A15 · GitOps Promotion

**Level:** Advanced · **Estimated time:** 3 hours · **Related:** [Module 18](../modules/README.md)

## Objective

Implement build-once, promote-by-PR delivery with a GitOps repo.

## Requirements

1. App repo builds an image tagged with the commit SHA.
2. CI opens a PR to the GitOps repo updating `overlays/dev`.
3. Promotion to staging and prod is a PR that copies the tag between overlays, with CODEOWNERS on prod.
4. Argo CD or Flux (kind/minikube is fine) syncs the cluster; demonstrate rollback by `git revert`.

## Deliverables

- Both repo links
- GITOPS.md with the diagram and a rollback demo

## Grading rubric

| Criterion | Points |
|---|---|
| Build once, tag by SHA | 25 |
| PR-based promotion | 30 |
| Agent sync working | 25 |
| Rollback demo | 20 |
| **Total** | **100** |

## Stretch goal

Add automatic image updates (Argo CD Image Updater or Flux image automation).

## Submission tip

Put everything in a public repository named `git-mastery-a15-gitops-promotion` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
